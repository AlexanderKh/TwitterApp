angular.module('twitter')
.controller("UserController", [ '$scope', '$stateParams', 'User', 'Upload',
  ($scope, $stateParams, User, Upload)->

    if $stateParams.id
      $scope.user = User.get(id: $stateParams.id)
    $scope.avatar = null

    $scope.updateAvatar = ()->
      promise = Upload.upload
        url: "/api/users/#{$scope.user.id}.json"
        method: 'PUT',
        data:
          user:
            avatar: $scope.avatar
      promise.then (response)->
        $scope.user = response.data
        $scope.avatar = null
      , (error)->
        console.log(error)
])

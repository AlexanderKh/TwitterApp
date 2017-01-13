angular.module('twitter')
.controller("UserController", [ '$scope', '$stateParams', '$http', 'User', 'Upload'
  ($scope, $stateParams, $http, User, Upload)->

    $scope.user = User.get(id: $stateParams.id)
    $scope.avatar = null

    $scope.follow = ()->
      $scope.user.$follow (response)->
        $scope.user.following = true
        console.log("You started following #{$scope.user.username}")
      , (error)->
        console.log(error)

    $scope.unfollow = ()->
      $scope.user.$unfollow (response)->
        $scope.user.following = false
        console.log("You unfollowed #{$scope.user.username}")
      , (error)->
        console.log(error)

    $scope.favourite = ()->
      $scope.user.$favourite (response)->
        $scope.user.favourite = true
        console.log("You added #{$scope.user.username} to favourites")
      , (error)->
        console.log(error)

    $scope.removeFavourite = ()->
      $scope.user.$removeFavourite (response)->
        $scope.user.favourite = false
        console.log("You removed #{$scope.user.username} from favourites")
      , (error)->
        console.log(error)

    $scope.setAvatar = (files)->
      $scope.avatar = files[0]

    $scope.updateAvatar = ()->
      promise = Upload.upload
        url: "/api/users/#{$scope.user.id}.json"
        method: 'PUT',
        data:
          user:
            avatar: $scope.avatar
      promise.then (response)->
        $scope.user = response.data
      , (error)->
        console.log(error)
])

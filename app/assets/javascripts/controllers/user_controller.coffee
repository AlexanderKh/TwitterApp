angular.module('twitter')
.controller("UserController", [ '$scope', '$stateParams', 'User', 'Upload', 'Favourite'
  ($scope, $stateParams, User, Upload, Favourite)->

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
      Favourite.save
        user_id: $scope.currentUser().id
        favourable_id: $scope.user.id
        favourable_type: 'user'
      , (response)->
        $scope.user.favourable_id = response.id
        console.log("You added #{$scope.user.username} to favourites")
      , (error)->
        console.log(error)

    $scope.removeFavourite = (user)->
      Favourite.remove { id: user.favourable_id }, (response)->
        user.favourable_id = null
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

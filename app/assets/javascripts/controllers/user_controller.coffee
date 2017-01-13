angular.module('twitter')
.controller("UserController", [ '$scope', '$stateParams', 'User'
  ($scope, $stateParams, User)->

    $scope.user = User.get(id: $stateParams.id)

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

])

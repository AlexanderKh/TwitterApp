angular.module('twitter')
.controller("FollowsController", [ '$scope', 'User'
  ($scope, User)->

    $scope.follow = (user)->
      User.follow user
      ,(response)->
        user.following = true
        console.log("You started following #{user.username}")
      , (error)->
        console.log(error)

    $scope.unfollow = (user)->
      User.unfollow user
      , (response)->
        user.following = false
        console.log("You unfollowed #{user.username}")
      , (error)->
        console.log(error)
])

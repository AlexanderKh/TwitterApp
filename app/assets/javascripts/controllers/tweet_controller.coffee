angular.module('twitter')
.controller("TweetController", [ '$scope', '$stateParams', 'Tweet', 'Comment',
  ($scope, $stateParams, Tweet, Comment)->

    $scope.tweet = Tweet.get(id: $stateParams.id)

    $scope.handleRemove = (tweet)->
      history.back()

    $scope.createComment = (formData)->
      Comment.save {tweet_id : $scope.tweet.id}, comment: formData
      , (response)->
        $scope.tweet.comments.unshift response
        $scope.commentsForm = { }
      , (error)->
        console.log(error)

    $scope.removeComment = (comment)->
      Comment.remove comment
      , (response)->
        index = $scope.tweet.comments.indexOf(comment)
        $scope.tweet.comments.splice(index, 1)
      , (error)->
        console.log(error)

    $scope.canDelete = (comment)->
      ownComment = comment.user_id == $scope.currentUser().id
      tweetsOwner = $scope.tweet.id == $scope.currentUser().id
      ownComment || tweetsOwner
])

angular.module('twitter')
.controller("TweetCommonController", [ '$scope', '$window', 'Tweet',
  ($scope, $window, Tweet)->

    $scope.updateTweet = (tweet)->
      Tweet.update tweet
      , (response)->
        angular.copy response, tweet
      , (error)->
        console.log(error.data)

    $scope.editTweet = (tweet)->
      tweet.oldContent = tweet.content
      tweet.editMode = true

    $scope.exitEditMode = (tweet)->
      tweet.content = tweet.oldContent
      tweet.editMode = false

    $scope.likeTweet = (tweet)->
      Tweet.like tweet
      , (response)->
        tweet.liked = true
      , (error)->
        console.log(error.data)

    $scope.unlikeTweet = (tweet)->
      Tweet.unlike tweet
      , (response)->
        tweet.liked = false
      , (error)->
        console.log(error.data)

    $scope.deleteTweet = (tweet)->
      return unless $window.confirm('Really delete?')
      Tweet.remove tweet
      , (response)->
        if $scope.handleRemove
          $scope.handleRemove(tweet)
      , (error)->
        console.log(error)

])

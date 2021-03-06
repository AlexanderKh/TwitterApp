angular.module('twitter')
.controller("TweetCommonController", [ '$scope', '$window', '$state', 'Tweet',
  ($scope, $window, $state, Tweet)->

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
        tweet.likes_count++
      , (error)->
        console.log(error.data)

    $scope.unlikeTweet = (tweet)->
      Tweet.unlike tweet
      , (response)->
        tweet.liked = false
        tweet.likes_count--
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

    $scope.opened = ()->
      $state.is('app.tweet')
])

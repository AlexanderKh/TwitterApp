angular.module('twitter')
.controller("TweetsController", [ '$scope', '$window', 'Tweet',
  ($scope, $window, Tweet)->
    $scope.tweet = null
    $scope.tweets = Tweet.query()

    $scope.createTweet = (tweetFormData)->
      tweet = new Tweet(tweetFormData)

      tweet.$save (response)->
        $scope.tweets.unshift response
        $scope.newTweetForm = { }
      , (error)->
        console.log(error.data)

    $scope.updateTweet = (tweet)->
      tweet.$update (response)->
        index = $scope.tweets.indexOf($scope.tweet)
        $scope.tweets[index] = response
        $scope.exitEditMode()
      , (error)->
        console.log(error.data)

    $scope.deleteTweet = (tweet)->
      return unless $window.confirm('Really delete?')
      tweet.$delete (response)->
        index = $scope.tweets.indexOf(tweet)
        $scope.tweets.splice(index, 1)
      , (error)->
        console.log(error)

    $scope.editTweet = (tweet)->
      $scope.newTweetForm = angular.copy tweet
      $scope.tweet = tweet

    $scope.exitEditMode = ()->
      $scope.tweet = null
      $scope.newTweetForm = { }

    $scope.like = ()->


])

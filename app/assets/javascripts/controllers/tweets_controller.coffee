angular.module('twitter')
.controller("TweetsController", [ '$scope', 'Tweet',
  ($scope, Tweet)->
    $scope.tweets = Tweet.query()

    $scope.createTweet = (tweetForm)->
      tweet = new Tweet(tweetForm)
      tweet.$save (response)->
        $scope.tweets.unshift response
        $scope.newTweetForm = {}
      , (error)->
        console.log(error.data)

])

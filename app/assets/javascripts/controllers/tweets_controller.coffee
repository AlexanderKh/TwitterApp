angular.module('twitter')
.controller("TweetsController", [ '$scope', '$window', 'Tweet',
  ($scope, $window, Tweet)->

    $scope.tweets = Tweet.query()

    $scope.createTweet = (tweetFormData)->
      tweet = new Tweet(tweetFormData)

      tweet.$save (response)->
        $scope.tweets.unshift response
        $scope.tweetForm = { }
      , (error)->
        console.log(error.data)

    $scope.handleRemove = (tweet)->
      index = $scope.tweets.indexOf(tweet)
      $scope.tweets.splice(index, 1)


])

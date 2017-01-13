angular.module('twitter')
.controller("TweetsController", [ '$scope', '$window', 'Tweet', 'Favourite',
  ($scope, $window, Tweet, Favourite)->
    $scope.tweet = null
    $scope.tweets = Tweet.query()

    $scope.createTweet = (tweetFormData)->
      tweet = new Tweet(tweetFormData)

      tweet.$save (response)->
        $scope.tweets.unshift response
        $scope.tweetForm = { }
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
      $scope.tweetForm = angular.copy tweet
      $scope.tweet = tweet

    $scope.exitEditMode = ()->
      $scope.tweet = null
      $scope.tweetForm = { }

    $scope.likeTweet = (tweet)->
      tweet.$like (response)->
        tweet.liked = true
      , (error)->
        console.log(error.data)

    $scope.unlikeTweet = (tweet)->
      tweet.$unlike (response)->
        tweet.liked = false
      , (error)->
        console.log(error.data)

    $scope.favourite = (tweet)->
      favourite = new Favourite
        user_id: $scope.currentUser().id
        favourable_id: tweet.id
        favourable_type: 'tweet'
      favourite.$save (response)->
        tweet.favourable_id = response.id
        console.log("You added #{tweet.content} to favourites")
      , (error)->
        console.log(error)

    $scope.removeFavourite = (tweet)->
      Favourite.remove { id: tweet.favourable_id }, (response)->
        tweet.favourable_id = null
        console.log("You removed #{tweet.content} from favourites")
      , (error)->
        console.log(error)
])

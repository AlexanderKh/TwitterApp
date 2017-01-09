angular.module('twitter')
.controller("TweetsController", [ '$scope', 'Tweet',
  ($scope, Tweet)->
    $scope.tweets = Tweet.query()
])

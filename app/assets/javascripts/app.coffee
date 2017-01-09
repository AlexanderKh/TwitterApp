twitter = angular.module('twitter', [
  'templates',
  'ngRoute',
  'ngResource'
])

twitter.config([ '$routeProvider',
  ($routeProvider)->
    $routeProvider
    .when('/',
      templateUrl: 'index.html'
    )
    .when('/tweets',
      templateUrl: 'tweets/index.html'
      controller: 'TweetsController'
    )
])

angular.module('twitter')
.controller("TweetsController", [ '$scope', '$routeParams', 'Tweet',
  ($scope, $routeParams, Tweet)->

    $scope.tweets = Tweet.query()

])

twitter = angular.module('twitter', [
  'templates',
  'ui.router',
  'ngResource'
])

twitter.config([ '$stateProvider', '$urlRouterProvider'
  ($stateProvider, $urlRouterProvider)->
    $urlRouterProvider.otherwise('/home');
    $stateProvider
    .state('app',
      templateUrl: 'layout.html'
    )
      .state('app.home',
        url: '/home',
        templateUrl: 'index.html'
      )
      .state('app.tweets',
        url: '/tweets'
        templateUrl: 'tweets/index.html'
        controller: 'TweetsController'
      )
      .state('app.signin',
        url: '/signin'
        templateUrl: 'authentication/signin.html'
        controller: 'AuthenticationController'
      )
])



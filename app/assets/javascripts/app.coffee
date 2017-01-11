twitter = angular.module('twitter', [
  'templates',
  'ui.router',
  'ngResource',
  'satellizer'
])

twitter.config([ '$stateProvider', '$urlRouterProvider'
  ($stateProvider, $urlRouterProvider)->

    skipIfLoggedIn = [ '$q', '$auth', ($q, $auth) ->
      deferred = $q.defer()
      console.log($auth.isAuthenticated())
      if $auth.isAuthenticated()
        deferred.reject()
      else
        deferred.resolve()
      deferred.promise
    ]

    loginRequired = [ '$q', '$location', '$auth', ($q, $location, $auth) ->
      deferred = $q.defer()
      if $auth.isAuthenticated()
        deferred.resolve()
      else
        $location.path '/login'
      deferred.promise
    ]

    $stateProvider
    .state('app',
      templateUrl: 'layout.html'
      controller: 'ApplicationController'
    )
    .state('app.home',
      url: '/home',
      templateUrl: 'index.html'
    )
    .state('app.tweets',
      url: '/tweets'
      templateUrl: 'tweets/index.html'
      controller: 'TweetsController'
      resolve:
        loginRequired: loginRequired
    )
    .state('app.register',
      url: '/register'
      templateUrl: 'authentication/register.html'
      controller: 'RegistrationController'
      resolve:
        skipIfLoggedIn: skipIfLoggedIn
    )
    .state('app.login',
      url: '/login'
      templateUrl: 'authentication/login.html'
      controller: 'LoginController'
      resolve:
        skipIfLoggedIn: skipIfLoggedIn
    )
    .state('app.logout',
      url: '/logout'
      template: null
      controller: 'LogoutController'
    )

    $urlRouterProvider.otherwise('/home');
])

twitter.config(['$authProvider'
  ($authProvider)->

    $authProvider.facebook({
      clientId: '1112861692158558'
    });
])

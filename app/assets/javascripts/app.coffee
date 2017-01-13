twitter = angular.module('twitter', [
  'templates',
  'ui.router',
  'ngResource',
  'LocalStorageModule',
  'ngFileUpload',
  'satellizer'
])

twitter.config([ '$stateProvider', '$urlRouterProvider'
  ($stateProvider, $urlRouterProvider)->

    skipIfLoggedIn = [ '$q', '$auth', ($q, $auth) ->
      deferred = $q.defer()
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
    .state('app.tweets',
      url: '/tweets'
      templateUrl: 'tweets/index.html'
      controller: 'TweetsController'
      resolve:
        loginRequired: loginRequired
    )
    .state('app.users',
      url: '/users'
      templateUrl: 'users/index.html'
      controller: 'UsersController'
    )
    .state('app.user',
      url: '/users/:id'
      templateUrl: 'users/user.html'
      controller: 'UserController'
      resolve:
        loginRequired: loginRequired
    )
    .state('app.favourites',
      url: '/favourites'
      templateUrl: 'favourites/index.html'
      controller: 'FavouritesController'
      resolve:
        loginRequired: loginRequired
    )
    .state('app.login',
      url: '/login'
      templateUrl: 'authentication/index.html'
      controller: 'AuthController'
      resolve:
        skipIfLoggedIn: skipIfLoggedIn
    )
    .state('app.logout',
      url: '/logout'
      template: null
      controller: 'LogoutController'
    )

    $urlRouterProvider.otherwise('/tweets');
])

twitter.config(['$authProvider'
  ($authProvider)->

    $authProvider.facebook({
      clientId: '1112861692158558'
    });
])



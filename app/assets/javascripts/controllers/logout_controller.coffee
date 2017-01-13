angular.module('twitter')
.controller("LogoutController", [ '$auth', '$state', 'localStorageService'
  ($auth, $state, localStorageService)->

    return unless $auth.isAuthenticated()
    $auth.logout().then ()->
      localStorageService.remove 'currentUser'
      console.log('You have been logged out')
      $state.go('app.login');

])

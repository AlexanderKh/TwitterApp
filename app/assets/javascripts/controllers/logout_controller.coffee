angular.module('twitter')
.controller("LogoutController", [ '$auth', '$state'
  ($auth, $state)->

    return unless $auth.isAuthenticated()
    $auth.logout().then ()->
      console.log('You have been logged out')
      $state.go('app.home');

])

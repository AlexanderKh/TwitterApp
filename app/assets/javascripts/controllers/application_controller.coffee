angular.module('twitter')
.controller("ApplicationController", [ '$scope', '$auth', 'localStorageService'
  ($scope, $auth, localStorageService)->

    $scope.isAuthenticated = ()->
      $auth.isAuthenticated()

    $scope.currentUser = ()->
      localStorageService.get('currentUser')

])

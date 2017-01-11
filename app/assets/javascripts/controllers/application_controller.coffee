angular.module('twitter')
.controller("ApplicationController", [ '$scope', '$auth'
  ($scope, $auth)->

    $scope.isAuthenticated = ->
      $auth.isAuthenticated()


])

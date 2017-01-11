angular.module('twitter')
.controller("LoginController", [ '$scope', '$auth', '$state'
  ($scope, $auth, $state)->

    $scope.authenticate = (provider)->
      $auth.authenticate(provider)

    $scope.login = (loginData)->
      promise = $auth.login(auth: loginData)
      promise.then (response)->
        $state.go('app.tweets')
])

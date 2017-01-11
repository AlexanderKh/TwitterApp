angular.module('twitter')
.controller("RegistrationController", [ '$scope', '$auth', '$state'
  ($scope, $auth, $state)->

    $scope.register = (registrationData)->
      promise = $auth.signup(auth: registrationData)
      promise.then (response)->
        $auth.setToken(response)
        $state.go('app.tweets')
        console.log 'You have successfully created a new account and have been signed-in'
      , (response) ->
        console.log response.data.message

])

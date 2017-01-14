angular.module('twitter')
.controller("AuthController", [ '$scope', '$auth', '$state', 'localStorageService'
  ($scope, $auth, $state, localStorageService)->

    $scope.authenticate = (provider)->
      promise = $auth.authenticate(provider)
      promise.then (response)->
        localStorageService.set('currentUser', response.data.user)
        $auth.setToken(response.data.token)
        $state.go('app.tweets')
        console.log "You have successfully signed-in using #{provider}"
      , (response) ->
        console.log response.data.message

    $scope.login = (loginData)->
      promise = $auth.login(auth: loginData)
      promise.then (response)->
        localStorageService.set('currentUser', response.data.user)
        $state.go('app.tweets')

    $scope.register = (registrationData)->
      promise = $auth.signup(auth: registrationData)
      promise.then (response)->
        localStorageService.set('currentUser', response.data.user)
        $auth.setToken(response.data.token)
        $state.go('app.tweets')
        console.log 'You have successfully created a new account and have been signed-in'
      , (response) ->
        console.log response.data.message
])

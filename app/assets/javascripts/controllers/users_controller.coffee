angular.module('twitter')
.controller("UsersController", [ '$scope', 'User'
  ($scope, User)->

    $scope.users = User.query()
])

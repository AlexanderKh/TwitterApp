angular.module('twitter')
.controller("FavouritesController", [ '$scope', 'Favourite',
  ($scope, Favourite)->

    $scope.favourites = Favourite.query()

    $scope.handleRemove = (favourite)->
      index = $scope.favourites.indexOf(favourite)
      $scope.favourites.splice(index, 1)

])

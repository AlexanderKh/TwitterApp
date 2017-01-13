angular.module('twitter')
.controller("FavouritesController", [ '$scope', '$window', 'Favourite',
  ($scope, $window, Favourite)->

    $scope.favourites = Favourite.query()

    $scope.removeFavourite = (favorable)->
      return unless $window.confirm('Really remove from favourites?')
      Favourite.remove { id: favorable.favourable_id }, (response)->
        index = $scope.favourites.indexOf(favorable)
        $scope.favourites.splice(index, 1)
        console.log("You removed #{favorable.id} from favourites")
      , (error)->
        console.log(error)

])

angular.module('twitter')
.controller("FavouriteController", [ '$scope', 'Favourite',
  ($scope, Favourite)->

    $scope.favourite = (favorable)->
      favourite = new Favourite
        user_id: $scope.currentUser().id
        favourable_id: favorable.id
        favourable_type: favorable.type
      favourite.$save (response)->
        favorable.favourable_id = response.id
        console.log("You added #{favorable.id} to favourites")
      , (error)->
        console.log(error)

    $scope.removeFavourite = (favorable)->
      Favourite.remove { id: favorable.favourable_id }, (response)->
        favorable.favourable_id = null
        console.log("You removed #{favorable.id} from favourites")
      , (error)->
        console.log(error)

])

angular.module('twitter').factory('Favourite', ['$resource',
  ($resource)->
    $resource('/api/favourites/:id.json', { id: '@id' })
])

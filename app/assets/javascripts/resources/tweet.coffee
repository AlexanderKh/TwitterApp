angular.module('twitter').factory('Tweet', ['$resource',
  ($resource)->
    $resource('/tweets/:id.json', { id: '@id' },
      'update': { method: 'PUT' }
    )
])

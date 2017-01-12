angular.module('twitter').factory('Tweet', ['$resource',
  ($resource)->
    $resource('/api/tweets/:id.json', { id: '@id' },
      'update': { method: 'PUT' }
      'like':
        method: 'PATCH'
        url: '/api/tweets/:id/like.json'
      'unlike':
        method: 'PATCH'
        url: '/api/tweets/:id/unlike.json'
    )
])

angular.module('twitter').factory('Tweet', ['$resource',
  ($resource)->
    $resource('/api/tweets/:id.json', { id: '@id' },
      'update': { method: 'PUT' }
      'like':
        method: 'POST'
        url: '/api/tweets/:id/like.json'
      'unlike':
        method: 'POST'
        url: '/api/tweets/:id/unlike.json'
    )
])

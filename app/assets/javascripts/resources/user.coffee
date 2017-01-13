angular.module('twitter').factory('User', ['$resource',
  ($resource)->
    $resource('/api/users/:id.json', { id: '@id' },
    'update': { method: 'PUT' }
    'follow':
      method: 'POST'
      url: '/api/users/:id/follow.json'
    'unfollow':
      method: 'POST'
      url: '/api/users/:id/unfollow.json'
    )
])

angular.module('twitter').factory('User', ['$resource',
  ($resource)->
    $resource('/api/users/:id.json', { id: '@id' },
    'follow':
      method: 'POST'
      url: '/api/users/:id/follow.json'
    'unfollow':
      method: 'POST'
      url: '/api/users/:id/unfollow.json'
    'favourite':
      method: 'POST'
      url: '/api/users/:id/favourite.json'
    'removeFavourite':
      method: 'POST'
      url: '/api/users/:id/remove_favourite.json'
    )
])

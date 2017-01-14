angular.module('twitter').factory('Comment', ['$resource',
  ($resource)->
    $resource('/api/tweets/:tweet_id/comments/:id.json')
])

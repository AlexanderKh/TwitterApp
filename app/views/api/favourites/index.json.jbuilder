json.array! @favourites do |favourite|
  json.partial! favourite.favourable
end

json.partial! @tweet
json.comments @tweet.comments do |comment|
  json.partial! comment
end

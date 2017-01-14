json.partial! @user
json.tweets @user.tweets.eager_load(:likes, :favouriables) do |tweet|
  json.partial! tweet
end

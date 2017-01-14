json.partial! @user
json.tweets @user.tweets do |tweet|
  json.partial! tweet
end

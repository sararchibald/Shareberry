json.array!(@friends) do |friend|
  json.extract! friend, 
  json.url friend_url(friend, format: :json)
end

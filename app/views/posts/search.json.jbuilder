json.array! @posts do |post|
  json.id post.id
  json.title post.title
  json.image post.image
  json.text post.text
  json.user_id post.user_id
  json.spot_id post.spot_id
  json.name post.user.name
end
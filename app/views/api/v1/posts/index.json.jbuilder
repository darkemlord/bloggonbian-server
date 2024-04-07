json.array! @posts do |post|
  json.extract! post, :title, :body
  json.author post.user.name
  json.id post.hashid
end

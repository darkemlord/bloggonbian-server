json.extract! @post, :hashid, :title, :body
json.author @post.user.name

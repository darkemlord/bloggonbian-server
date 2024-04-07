json.array! @posts do |post|
  json.extract! post, :title, :body
end

json.array! @genres do |genre|
  json.extract! genre, :name, :description
  json.id genre.hashid
end

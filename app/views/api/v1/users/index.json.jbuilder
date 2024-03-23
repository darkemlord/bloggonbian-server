json.array! @users do |user|
  json.extract! user, :email, :name
  json.id user.hashid
end

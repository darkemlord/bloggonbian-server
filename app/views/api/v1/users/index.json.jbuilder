json.array! @users do |user|
  json.extract! user, :hashid, :email, :name
end

Rails.application.routes.draw do
  namespace :api do
    namespace :v1, defaults: { format: :json }  do
      resources :users
    end
  end
  post '/register', to: 'auth#register'
  post '/login', to: 'auth#login'
  post '/logout', to: 'auth#logout'
end

Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      post '/users/sign_in', to: 'sessions#create'
      resources :users
    end
  end
end

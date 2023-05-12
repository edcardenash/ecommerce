Rails.application.routes.draw do
  devise_for :clients
  devise_for :admins
  devise_for :users
  root to: "pages#home"
  namespace :api do
    namespace :v1 do
      devise_for :admins, controllers: { sessions: 'api/v1/admins/sessions' }, defaults: { format: :json }
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end

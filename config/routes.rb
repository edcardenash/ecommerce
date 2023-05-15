Rails.application.routes.draw do
  devise_for :clients
  devise_for :admins
  devise_for :users
  root to: "pages#home"
  namespace :api do
    namespace :v1 do
      devise_for :admins, controllers: { sessions: 'api/v1/admins/sessions' }, defaults: { format: :json }
      resources :products do
        get :top_products, on: :collection
        get :top_revenue_products, on: :collection
      end
      resources :purchases do
        get :purchases_by_granularity, on: :collection
      end
    end
  end
end

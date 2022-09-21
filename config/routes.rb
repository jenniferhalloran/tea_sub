Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :subscriptions, only: [:create, :update]
      get 'customers/:id/subscriptions', to: 'user_subscriptions#index'
    end
  end
end

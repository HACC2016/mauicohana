Rails.application.routes.draw do
  devise_for :users

   # token auth routes available at /api/v1/auth
  namespace :api do
    scope :v1 do
      mount_devise_token_auth_for 'User', at: 'auth'
    end
    namespace :v1 do
      get 'users/me' => 'users#me'
      resources :users
      resources :categories
      resources :companies do
        resources :categorizations
        resources :contacts
        resources :user_companies
      end
    end
  end  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "home#index"
end

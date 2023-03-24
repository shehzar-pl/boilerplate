Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks', sessions: 'users/sessions' }
  
  resources :otps, only: [:new]
  post 'generate_otp', to: 'otps#create'
  get 'verify_otp', to: 'otps#verify'
  post 'verify_otp', to: 'otps#check'
  
  root to: "home#index"
end

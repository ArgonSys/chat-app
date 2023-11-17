Rails.application.routes.draw do
  devise_for :users, except: [:edit]
  get 'messages/index'
  root to: "messages#index"
  resources :users, only:[:edit, :update]
end

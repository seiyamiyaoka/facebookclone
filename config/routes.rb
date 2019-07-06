Rails.application.routes.draw do
  resources :pictures
  resources :sessions, only: [:new, :create, :destroy]
  resources :users
  resources :contents  do
    collection do
      post :confirm
    end
  end
end

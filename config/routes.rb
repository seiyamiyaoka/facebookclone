Rails.application.routes.draw do
  resources :contents  do
    collection do
      post :confirm
    end
  end
end

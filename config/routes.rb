Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  
  # Defines the root path route ("/")
  root  "welcome#index"
  resources :users, only: [:index] do
    resources :recipes, only: [:index, :new, :show, :create, :destroy]
    resources :inventories, only: [:index, :new, :show, :create, :destroy] do
      resources :inventory_foods, only:  [:index, :new, :show, :create, :destroy]
    end
  end
  resources :foods, only: %i[index new create]
end

Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")

  root "public_recipes#index"

  get 'public_recipes', to: 'public_recipes#index', as: 'public_recipes'
  resources :users, only: [:index] do
    resources :recipes, only: [:index, :new, :destroy, :create, :show]

    resources :inventory, only: [:index, :new, :show, :create, :destroy] do
      resources :inventory_foods, only:  [:index, :new, :show, :create, :destroy]
    end
  end

  resources :foods, only: %i[index new create]
end

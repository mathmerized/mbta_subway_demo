Rails.application.routes.draw do
  resources :subways, only: [:index, :show]
  get 'subways/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "subways#index"
end

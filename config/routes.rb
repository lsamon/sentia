Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root "pages#index"
  post "import-people" => "pages#import"

  resources :people, only: %i[index]
end

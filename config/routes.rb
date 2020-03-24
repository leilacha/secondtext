Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'products#books'
  get 'livres', to: 'products#books', as: 'books'
  get 'films', to: 'products#movies', as: 'movies'
  resources :products, only: [:show]
end

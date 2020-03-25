Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'products#books'
  get 'livres', to: 'products#books', as: 'books'
  get 'films', to: 'products#movies', as: 'movies'
  get 'about', to: 'static_pages#about', as: 'about'
  resources :products, only: [:show] do
      member do
        post 'like'
        delete 'unlike'
      end
  end
  resources :authors, only: [:show]
end

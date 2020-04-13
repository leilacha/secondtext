Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'products#books'
  get 'livres', to: 'products#books', as: 'books'
  get 'films', to: 'products#movies', as: 'movies'
  get 'about', to: 'static_pages#about', as: 'about'
  resources :products do
      member do
        post 'like'
        delete 'unlike'
        post 'comment'
      end
  end
  get 'select_section', to: 'products#select_section', as: 'select_section'
  get 'validate', to: 'products#validate', as: 'validate'
  resources :authors, only: [:show, :edit, :update]
  resources :comments, only: [:destroy]
end

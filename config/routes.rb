Rails.application.routes.draw do
  devise_for :users
  root "spots#index"
  resources :users, only: [:show, :edit, :update]
  resources :spots, only: [:index, :show, :create] do
    resources :posts do
      resource :favorites, only: [:create, :destroy]
      resources :comments, only: :create
      collection do
        get 'search'
      end
    end
  end
end

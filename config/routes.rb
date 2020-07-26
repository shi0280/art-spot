Rails.application.routes.draw do
  devise_for :users
  root to: "spots#index"
  resources :users, only: [:show, :edit, :update]
  resources :spots, only: [:index, :show] do
    resources :posts do
      resource :favorites, only: [:create, :destroy]
    end
  end
end

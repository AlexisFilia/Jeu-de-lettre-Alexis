Rails.application.routes.draw do

  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html


  resources :games, only: [:new, :create, :show], shallow: true do
    resources :parties, only: [:new, :show], shallow: true do
      resources :solutions, only: [:new, :create, :show]
    end
  end
end

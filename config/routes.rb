Rails.application.routes.draw do
  get 'solutions/new'
  get 'solutions/create'
  get 'solutions/show'
  get 'parties/new'
  get 'parties/create'
  get 'parties/show'
  get 'games/new'
  get 'games/create'
  get 'games/show'
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

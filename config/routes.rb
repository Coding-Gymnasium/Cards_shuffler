Rails.application.routes.draw do
  root 'pages#index'

  resources :cards, only: %i[show]
end

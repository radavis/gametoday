Gametoday::Application.routes.draw do
  devise_for :users
  resources :events, only: [:index]
  root "events#index"
end

Gametoday::Application.routes.draw do
  resources :events, only: [:index]
  root "events#index"
end

Gametoday::Application.routes.draw do
  resources :events

  root "events#index"

  # from: http://stackoverflow.com/a/5233852
  get '*path', :controller => 'events', :action => 'index'
end

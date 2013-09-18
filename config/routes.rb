Gametoday::Application.routes.draw do
  resources :events

  # from: http://stackoverflow.com/a/5233852
  get '*path', :controller => 'events', :action => 'index'
end

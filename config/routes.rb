Rails.application.routes.draw do
  root 'static#home'

  get '/help' to: 'static/help'

  get '/nowplaying' to: 'nowplaying/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

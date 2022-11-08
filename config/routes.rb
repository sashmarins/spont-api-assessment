Rails.application.routes.draw do
  get '/blogs', to: 'blogs#index'
  get '/blogs/:id', to: 'blogs#show'
  delete '/blogs/:id', to: 'blogs#destroy'
  post '/blogs', to: 'blogs#create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

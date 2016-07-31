Rails.application.routes.draw do
  get 'sessions/new'

  # 获得注册界面的地址
  get '/signup'=>"users#new"

  # 请求注册的地址
  post '/signup'=>"users#create"

  root "static_pages#home"

  get '/home'=>"static_pages#home"

  get '/help'=>"static_pages#help"

  get '/about'=>"static_pages#about"

  get '/contact'=>"static_pages#contact"

  # 获得登陆界面的地址
  get '/login'=>'sessions#new'

  # 请求登陆的地址
  post '/login'=>'sessions#create'
  delete '/logout'=>'sessions#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users
end

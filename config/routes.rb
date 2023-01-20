Rails.application.routes.draw do
  root 'pages#home'
  get 'about', to: "pages#about"
  resources :articles # основные методы = руты
  get 'signup', to: 'users#new' # задаем рут для основного метода new
  resources :users, except: [:new] # задаем руты основным методами кроме new
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  resources :categories, except: [:destroy]


  # scope :about do
  #   get '/', to: 'pages#about'
  # end
end

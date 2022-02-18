Rails.application.routes.draw do
  get 'home/index'
  get 'about/index'

  root "home#index"

  resources :articles do
    resources :comments
  end

end

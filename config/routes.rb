Rails.application.routes.draw do
  get 'inquiry/index'
  get 'home/index'
  get 'about/index'

  root "home#index"

  resources :inquiries

  resources :articles do
    resources :comments
  end

end

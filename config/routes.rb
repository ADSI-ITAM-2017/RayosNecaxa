Rails.application.routes.draw do
  devise_for :usuarios
  get 'landing_page/index'
  root 'landing_page#index'

  get 'galleries' => 'galleries#index'

  resources :properties

  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

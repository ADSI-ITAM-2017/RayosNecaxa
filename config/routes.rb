Rails.application.routes.draw do
  get 'landing_page/index'
  root 'landing_page#index'
  get 'swipe_propiedades/index'
  get 'swipe_propiedades/new', as: 'nuevo'
  get 'swipe_propiedades/create'

  #resources :swipe_propiedades
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

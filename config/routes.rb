Rails.application.routes.draw do

  root to: "markers#index"
  resources :markers

  get 'all', to: 'markers#display'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

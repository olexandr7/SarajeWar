Rails.application.routes.draw do

  root to: "markers#map"
  resources :markers#, only: [:index, :show]

  #get "/admin/show" => "welcome#info"





  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

Rails.application.routes.draw do
  resources :drones

  root "drones#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

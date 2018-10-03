Rails.application.routes.draw do
  resources :orders
  resources :addresses
  resources :nav_logs
  devise_for :staffs, path: 'staffs'
  # controllers: { sessions: "staffs/session"}
  devise_for :customers, path: 'customers'
  resources :drones

  root "orders#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

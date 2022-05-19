Rails.application.routes.draw do
  root to: 'pages#home'
  resources :customers

  resources :proposals do
    resources :object_items
  end



  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

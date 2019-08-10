Rails.application.routes.draw do

  root 'contents#index'
  get 'pages' => 'contents#pages'

  resources :sendgrid do
    match :callback, on: :collection, via: [:get, :post]
  end
  
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

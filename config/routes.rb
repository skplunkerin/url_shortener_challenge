Rails.application.routes.draw do
  match   '/s/:id',   to: "redirects#redirect",     via: [:get, :post]
  resources :redirects

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

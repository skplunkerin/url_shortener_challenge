Rails.application.routes.draw do
  match   '/s/:id',   to: "redirects#redirect",     via: [:get, :post]
  resources :redirects do
  end
  match 'report', to: "redirects#report",   via: [:get], as: :redirect_report

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

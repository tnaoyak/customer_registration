Rails.application.routes.draw do
  get 'customers/new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "customers#new"
end

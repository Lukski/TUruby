Rails.application.routes.draw do
  devise_for :users
  root 'person#search'
  get 'person/search'
  get 'person/detail/:id', to: 'person#detail'
  get 'favorites/create', to: 'favorites#create'

  get 'course/search'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

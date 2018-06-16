Rails.application.routes.draw do
  devise_for :users
  root 'person#search'
  get 'person/search', as: 'search_person'
  get 'person/detail/:id', to: 'person#detail'

  get 'favorites', to: 'favorites#index', as: 'favorites'
  get 'favorites/create', to: 'favorites#create'
  delete 'favorites/delete/:object_type/:tiss_id', to: 'favorites#delete', as: 'deletefavorite'

  get 'course/search', as: 'search_course'
  get 'course/detail/:id', to: 'course#detail'

  get 'thesis/search', as: 'search_thesis'
  get 'thesis/detail/:id', to: 'thesis#detail'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

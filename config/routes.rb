Rails.application.routes.draw do
  get 'person/search'
  get 'person/detail/:id', to: 'person#detail'

  get 'course/search'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
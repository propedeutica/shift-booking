Rails.application.routes.draw do
  get 'information/info'
  get 'information/about'
  root 'information#about'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

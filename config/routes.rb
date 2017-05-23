Rails.application.routes.draw do
  devise_for :admins
  devise_for :users
  get 'information/info'
  get 'information/about'
  root 'information#about'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

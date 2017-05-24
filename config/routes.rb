Rails.application.routes.draw do
  devise_for :admins
  devise_for :users
  get 'information/info'
  get 'information/about'

  authenticated :user do
    root to: "users#show"
  end

  authenticate :user do
    resources :users, only: [:show]
    resources :rooms, only: [:index]
    namespace :user do
      resources :offsprings, shallow: true do
        resource :assignment, expect: [:show, :update]
      end
    end
  end

  authenticated :admin do
    root to: "admin/dashboard#index"
  end

  authenticate :admin do
    namespace :admin do
      resources :users, only: [:index, :show, :edit, :update, :destroy]
      resources :offsprings, only: [:index, :show]
      post 'myconfig/global_lock_enable', to: "myconfig#global_lock_enable"
      post 'myconfig/global_lock_disable'
      post 'myconfig/global_lock_switch'
      get 'dashboard/index'
      # Resources for Rooms and Shifts
      get 'shifts/destroy_all', to: 'shifts#destroy_all'
      resources :rooms do
        collection do
          get 'destroy_all'
        end
        resources :shifts, shallow: true, except: [:index]
      end
      get 'dashboard', to: "dashboard#index"
      resources :admins, only: [:index]
    end
  end
  root to: 'information#about'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

Rails.application.routes.draw do

  get 'boats/index'

  get 'boats/new'

  get 'boats/edit'

  get 'boats/show'

  get 'boats/destroy'

  devise_for :users
  resources :boats
  resources :jobs 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
root to: 'jobs#index'

end

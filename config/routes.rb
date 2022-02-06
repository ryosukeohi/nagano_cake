Rails.application.routes.draw do
  root to: 'homes#top'
get '/about' => 'homes#about'
get '/customers/show' => 'customers#show'
get '/customers/edit' => 'customers#edit'
patch '/customers/update' => 'customers#update'
get '/customers/confirm' => 'customers#confirm'
patch '/customers/withdraw' => 'customers#withdraw'


  devise_for :admins, controllers: {
  sessions:      'admins/sessions',
  passwords:     'admins/passwords',
  registrations: 'admins/registrations'
}

  devise_for :customers, controllers: {
  sessions:      'customers/sessions',
  passwords:     'customers/passwords',
  registrations: 'customers/registrations'
}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


resources :orders, only: [:new, :create, :index, :show]
post 'orders/confirm' => 'orders#confirm'
get '/complete' => 'orders#complete'

resources :items, only: [:index, :show]

resources :cart_items, only: [:index, :destroy, :create, :update]
delete '/clear' => 'cart_items#clear'

resources :addresses, only: [:index, :create, :destroy, :edit, :update]


namespace :admin do
get '/homes/top' => 'homes#top'
resources :genres, only: [:index, :create, :edit, :update]
resources :items, except: [:destroy]
resources :customers, only: [:index, :show, :edit, :update,]
resources :orders, only: [:show]
end

end

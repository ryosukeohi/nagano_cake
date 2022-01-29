Rails.application.routes.draw do
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
root to: 'homes#top'
get '/about' => 'homes#about'
get '/customers/show' => 'customers#show'
get '/customers/edit' => 'customers#edit'
patch '/customers/update' => 'customers#update'
get '/customers/confirm' => 'customers#confirm'
get '/customers/withdraw' => 'customers#withdraw'

resources :ordrers, only: [:new, :create, :index, :show]
resources :items, only: [:index, :show]
resources :cart_items, only: [:index, :destroy, :create, :update]
resources :addresses, except: [:new, :show]

delete '/cart_items/clear' => 'cart_items#clear'

namespace :admin do
get '/homes/top' => 'homes#top'
resources :genres, only: [:index, :create, :edit, :update]
resources :items, except: [:destroy]
resources :customers, only: [:index, :show, :edit, :update,]
end

end

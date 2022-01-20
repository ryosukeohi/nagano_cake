Rails.application.routes.draw do
  devise_for :customers
  devise_for :admin
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
namespace :admin do
root to: 'homes#top'
resources :genres, only: [:index, :create, :edit, :update]
resources :items, except: [:destroy]
resources :customers, only: [:index, :show, :edit, :update,]
end

root to: 'homes#top'
get '/about' => 'homes#about'
get '/customers/show' => 'customers#show'
get '/customers/edit' => 'customers#edit'
patch '/customers/update' => 'customers#update'
get '/customers/confirm' => 'customers#confirm'
get '/customers/withdraw' => 'customers#withdraw'
end

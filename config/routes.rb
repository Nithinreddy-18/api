Rails.application.routes.draw do
  #devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users, :controllers => { :omniauth_callbacks => "omniauth_callbacks" }
  namespace :api do
    namespace :v1 do
  		resources :articles 
  		resource :sessions, only: [:create, :destroy] 		
  	end  	
  end
  resources :articles
end

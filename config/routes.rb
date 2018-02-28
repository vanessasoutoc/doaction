Rails.application.routes.draw do

    devise_for :users, controllers: { registrations: "registrations", omniauth_callbacks: "callbacks" }  

    namespace :api do
        scope :v1 do
            mount_devise_token_auth_for 'User', at: 'auth'
        end
    end

    mount ActionCable.server, at: '/cable'

    mount GrapeSwaggerRails::Engine, at: "/documentation"

    mount API::Base, at: "/"

    root to: 'dashboards#index'

    resources :dashboards
    resources :ongs
    resources :messages

    get 'messages/new/:id' => 'messages#new', as: 'new'
    get 'messages/newresponse/:id' => 'messages#newresponse', as: 'newresponse'
    post 'messages/createresponse' => 'messages#createresponse', as: 'createresponse'

    resources :users, except: :create
    resources :users, only: [:edit] do
        collection do
            patch 'update'
        end
    end

    post 'create_user' => 'users#create', as: :create_user  
    get 'edit_user' => 'users#edit_my_data', as: :edit_my_user
    patch 'update_my_data' => 'users#update_my_data', as: :update_my_data
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

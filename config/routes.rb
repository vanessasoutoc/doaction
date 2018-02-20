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

    get 'message/:id' => 'ongs#message', as: :message
    post 'send_message' => 'ongs#send_message'

    resources :users, except: :create
    resources :users, only: [:edit] do
        collection do
            patch 'update'
        end
    end

    post 'create_user' => 'users#create', as: :create_user  
    get 'edit_user' => 'users#edit', as: :edit_my_user
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

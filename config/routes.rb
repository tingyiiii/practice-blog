Rails.application.routes.draw do
  root 'posts#index'

  scope :users, only: [] do
    resource :registrations, path: '/', only: [:create] do
      get '/sign_up', action: 'new', as: 'new'
    end

    resource :sessions, path: '/', only: [] do
      get '/sign_in', action: 'new', as: 'new'
      post '/sign_in', action: 'create', as: 'create'
      delete '/sign_out', action: 'destroy', as: 'destroy'
    end
  end

  resources :posts
end

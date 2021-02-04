Rails.application.routes.draw do
  root 'posts#index'

  scope :users, only: [] do
    resource :registrations, path: '/', only: [:create] do
      get '/sign_up', action: 'new', as: 'new'
    end
  end

  resources :posts
end

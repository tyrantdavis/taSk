Rails.application.routes.draw do
  resources :users, only: [:show] do
    resources :items, only: [:create] # add :edit, :update, :destroy 
  end

  devise_for :users

  authenticated :user do 
        root 'users#show', as: :authenticated_root
  end


  get 'welcome/index'
  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

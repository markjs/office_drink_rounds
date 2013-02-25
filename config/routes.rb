OfficeDrinkRounds::Application.routes.draw do

  resources :user_groups, path: 'groups' do
    resources :invites do
      get 'new_user'
      post 'create_user'
    end
  end

  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  resources :sessions

  resources :users

  root to: 'welcome#index'

  mount Rack::GitSha => '/sha'

end

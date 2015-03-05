Galacsi::Application.routes.draw do
  devise_for :users
  resources :classe_therapeutiques, :decisions, :demandes, :distinctions, :users, :fiches, :pages

  resources :specialites do
    get :stripped_names, :on => :collection
  end

  resources :sources do
    get :names, :on => :collection
  end

  resources :dcis do
    get :stripped_names, :on => :collection
    resources :fiches
  end

  root :to => "pages#show", :permalink => 'home'

  match '/search' => "fiches#search", via: :get

  match '/:permalink' => "pages#show", as: :home, via: :get
end

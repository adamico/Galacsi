Galacsi::Application.routes.draw do
  devise_for :users
  resources :classe_therapeutiques, :decisions, :demandes, :distinctions,
            :users, :fiches, :pages, :specialites, :sources

  resources :dcis do
    resources :fiches
  end

  root to: 'pages#show', permalink: 'home'

  match '/search' => "fiches#search", via: :get
  match '/:permalink' => "pages#show", as: :home, via: :get
end

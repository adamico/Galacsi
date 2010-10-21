ActionController::Routing::Routes.draw do |map|
  map.devise_for :users

  map.resources :decisions, :demandes, :distinctions, :users, :fiches, :pages
  map.resources :dcis, :collection => { :search => :get, :stripped_names => :get }
  map.resources :classe_therapeutiques
  map.resources :specialites, :collection => { :stripped_names => :get }

  map.resources :sources, :collection => { :names => :get }

  map.resources :dcis do |dci|
    dci.resources :fiches, :member => { 
      :initialiser => :put,
      :valider => :put,
      :invalider => :put,
      :maj_date => :put
    }
  end

  map.root :controller => 'pages', :action => 'show', :permalink => 'home'
  map.search '/search', :controller => 'dcis', :action => 'search'

  map.home ':permalink', :controller => 'pages', :action => 'show'
end

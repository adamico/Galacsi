ActionController::Routing::Routes.draw do |map|
  map.devise_for :users

  map.resources :decisions, :demandes, :distinctions, :sources, :users
  map.resources :dcis, :collection => { :search => :get, :stripped_names => :get }
  map.resources :classe_therapeutiques, :collection => { :stripped_names => :get }
  map.resources :specialites, :collection => { :names => :get }

  map.resources :dcis do |dci|
    dci.resources :fiches, :member => { 
      :initialiser => :put,
      :valider => :put,
      :invalider => :put,
      :maj_date => :put
    }
  end

  map.resources :fiches

  map.root :controller => 'welcome'

  map.search '/search', :controller => 'welcome', :action => 'search'
  map.about '/about', :controller => 'welcome', :action => 'about'
  map.admin '/admin', :controller => 'welcome', :action => 'admin'
end

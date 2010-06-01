ActionController::Routing::Routes.draw do |map|
  map.devise_for :users

  map.resources :classe_therapeutiques

  map.resources :decisions

  map.resources :demandes, :specialites, :distinctions, :sources

  map.resources :dcis, :collection => { :search => :get }
  map.resources :dcis do |dci|
    dci.resources :fiches, :member => { :initialiser => :put }
    dci.resources :fiches, :member => { :valider => :put }
    dci.resources :fiches, :member => { :invalider => :put }
    dci.resources :fiches, :member => { :maj_date => :put }
  end

  map.resources :users

  map.root :controller => 'welcome'
  
  map.search '/search', :controller => 'welcome', :action => 'search'
  map.admin '/admin', :controller => 'welcome', :action => 'admin'

end

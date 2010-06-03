ActionController::Routing::Routes.draw do |map|
  map.devise_for :users

  map.resources :classe_therapeutiques, :decisions, :demandes, :specialites, :distinctions, :sources, :users

  map.resources :dcis, :collection => { :search => :get }

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
  map.admin '/admin', :controller => 'welcome', :action => 'admin'
end

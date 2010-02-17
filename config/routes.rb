ActionController::Routing::Routes.draw do |map|
  map.resources :distinctions

  map.resources :demandes, :specialites

  map.resources :dcis, :collection => { :search => :get }
  map.resources :dcis do |dci|
    dci.resources :fiches, :member => { :initialiser => :put }
    dci.resources :fiches, :member => { :valider => :put }
    dci.resources :fiches, :member => { :invalider => :put }
    dci.resources :fiches, :member => { :maj_date => :put }
  end

  map.resources :users

  map.root :controller => 'welcome'

  map.login 'login', :controller => 'user_sessions', :action => 'new'
  map.logout 'logout', :controller => 'user_sessions', :action => 'destroy'
  map.resources :user_sessions
end

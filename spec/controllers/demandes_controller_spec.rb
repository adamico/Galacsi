require File.dirname(__FILE__) + '/../spec_helper'
 
describe DemandesController do
  fixtures :all
  integrate_views
  
  it "index action should render index template" do
    get :index
    response.should render_template(:index)
  end
  
  it "show action should render show template" do
    get :show, :id => Demande.first
    response.should render_template(:show)
  end
  
  it "new action should render new template" do
    get :new
    response.should render_template(:new)
  end
  
  it "create action should render new template when model is invalid" do
    Demande.any_instance.stubs(:valid?).returns(false)
    post :create
    response.should render_template(:new)
  end
  
  it "create action should redirect when model is valid" do
    Demande.any_instance.stubs(:valid?).returns(true)
    post :create
    response.should redirect_to(demande_url(assigns[:demande]))
  end
  
  it "edit action should render edit template" do
    get :edit, :id => Demande.first
    response.should render_template(:edit)
  end
  
  it "update action should render edit template when model is invalid" do
    Demande.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Demande.first
    response.should render_template(:edit)
  end
  
  it "update action should redirect when model is valid" do
    Demande.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Demande.first
    response.should redirect_to(demande_url(assigns[:demande]))
  end
  
  it "destroy action should destroy model and redirect to index action" do
    demande = Demande.first
    delete :destroy, :id => demande
    response.should redirect_to(demandes_url)
    Demande.exists?(demande.id).should be_false
  end
end

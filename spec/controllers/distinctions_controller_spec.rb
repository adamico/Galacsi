require File.dirname(__FILE__) + '/../spec_helper'
 
describe DistinctionsController do
  fixtures :all
  integrate_views
  
  it "index action should render index template" do
    get :index
    response.should render_template(:index)
  end
  
  it "show action should render show template" do
    get :show, :id => Distinction.first
    response.should render_template(:show)
  end
  
  it "new action should render new template" do
    get :new
    response.should render_template(:new)
  end
  
  it "create action should render new template when model is invalid" do
    Distinction.any_instance.stubs(:valid?).returns(false)
    post :create
    response.should render_template(:new)
  end
  
  it "create action should redirect when model is valid" do
    Distinction.any_instance.stubs(:valid?).returns(true)
    post :create
    response.should redirect_to(distinction_url(assigns[:distinction]))
  end
  
  it "edit action should render edit template" do
    get :edit, :id => Distinction.first
    response.should render_template(:edit)
  end
  
  it "update action should render edit template when model is invalid" do
    Distinction.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Distinction.first
    response.should render_template(:edit)
  end
  
  it "update action should redirect when model is valid" do
    Distinction.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Distinction.first
    response.should redirect_to(distinction_url(assigns[:distinction]))
  end
  
  it "destroy action should destroy model and redirect to index action" do
    distinction = Distinction.first
    delete :destroy, :id => distinction
    response.should redirect_to(distinctions_url)
    Distinction.exists?(distinction.id).should be_false
  end
end

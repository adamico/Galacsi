require File.dirname(__FILE__) + '/../spec_helper'
 
describe DecisionsController do
  fixtures :all
  integrate_views
  
  it "index action should render index template" do
    get :index
    response.should render_template(:index)
  end
  
  it "show action should render show template" do
    get :show, :id => Decision.first
    response.should render_template(:show)
  end
  
  it "new action should render new template" do
    get :new
    response.should render_template(:new)
  end
  
  it "create action should render new template when model is invalid" do
    Decision.any_instance.stubs(:valid?).returns(false)
    post :create
    response.should render_template(:new)
  end
  
  it "create action should redirect when model is valid" do
    Decision.any_instance.stubs(:valid?).returns(true)
    post :create
    response.should redirect_to(decision_url(assigns[:decision]))
  end
  
  it "edit action should render edit template" do
    get :edit, :id => Decision.first
    response.should render_template(:edit)
  end
  
  it "update action should render edit template when model is invalid" do
    Decision.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Decision.first
    response.should render_template(:edit)
  end
  
  it "update action should redirect when model is valid" do
    Decision.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Decision.first
    response.should redirect_to(decision_url(assigns[:decision]))
  end
  
  it "destroy action should destroy model and redirect to index action" do
    decision = Decision.first
    delete :destroy, :id => decision
    response.should redirect_to(decisions_url)
    Decision.exists?(decision.id).should be_false
  end
end

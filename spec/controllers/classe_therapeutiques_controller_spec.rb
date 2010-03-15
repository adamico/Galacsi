require File.dirname(__FILE__) + '/../spec_helper'
 
describe ClasseTherapeutiquesController do
  fixtures :all
  integrate_views
  
  before(:each) do
    activate_authlogic
    UserSession.create Factory.build(:user, :role => "valideur")
  end
  it "index action should render index template" do
    get :index
    response.should render_template(:index)
  end
  
  it "show action should render show template" do
    get :show, :id => ClasseTherapeutique.first
    response.should render_template(:show)
  end
  
  it "new action should render new template" do
    get :new
    response.should render_template(:new)
  end
  
  it "create action should render new template when model is invalid" do
    ClasseTherapeutique.any_instance.stubs(:valid?).returns(false)
    post :create
    response.should render_template(:new)
  end
  
  it "create action should redirect when model is valid" do
    ClasseTherapeutique.any_instance.stubs(:valid?).returns(true)
    post :create
    response.should redirect_to(classe_therapeutique_url(assigns[:classe_therapeutique]))
  end
  
  it "edit action should render edit template" do
    get :edit, :id => ClasseTherapeutique.first
    response.should render_template(:edit)
  end
  
  it "update action should render edit template when model is invalid" do
    ClasseTherapeutique.any_instance.stubs(:valid?).returns(false)
    put :update, :id => ClasseTherapeutique.first
    response.should render_template(:edit)
  end
  
  it "update action should redirect when model is valid" do
    ClasseTherapeutique.any_instance.stubs(:valid?).returns(true)
    put :update, :id => ClasseTherapeutique.first
    response.should redirect_to(classe_therapeutique_url(assigns[:classe_therapeutique]))
  end
  
  it "destroy action should destroy model and redirect to index action" do
    classe_therapeutique = ClasseTherapeutique.first
    delete :destroy, :id => classe_therapeutique
    response.should redirect_to(classe_therapeutiques_url)
    ClasseTherapeutique.exists?(classe_therapeutique.id).should be_false
  end
end

require 'spec_helper'

describe ClasseTherapeutiquesController do
  render_views

  before(:each) do
    user = Factory(:contributeur)
    sign_in :user, user
  end

  describe "GET 'index'" do
    it "should be successful" do
      get :index
      response.should be_success
    end
    it "should assign classe therapeutiques to a global var" do
      get :index
      assigns(:classe_therapeutiques).should_not be_nil
    end
  end

  describe "GET 'stripped_names'" do
    it "should be successful" do
      get :stripped_names, :format => :js
      response.should be_success
    end
    it "should render an array of stripped names" do
      pending("maybe need to move this example to request specs")
      3.times do |i|
        Factory(:classe_therapeutique, :name => "name#{i+1}")
      end
      get :stripped_names, :format => :js
      response.should have_selector("pre", :content => '["name1", "name2", "name3"]')
    end
  end

  describe "GET 'show'" do
    let(:ct) {Factory(:classe_therapeutique)}

    it "should be successful" do
      get :show, :id => ct
      response.should be_success
    end
  end

  describe "GET 'new'" do
    it "should be successful" do
      sign_in :user, Factory(:valideur)
      get :new
      response.should be_success
    end
  end

  describe "POST 'create'" do
    before(:each) do
      sign_in :user, Factory(:valideur)
    end
    context "failure" do
      let(:invalid_ct) { {:name => ""}}
      it "should not create a classe therapeutique" do
        expect do
          post :create, :classe_therapeutique => invalid_ct
        end.should_not change(ClasseTherapeutique, :count)
      end
      it "should render the new template" do
        post :create, :classe_therapeutique => invalid_ct
        response.should render_template('new')
      end
    end
    context "success" do
      it "should create a classe_therapeutique" do
        expect do
          post :create, :classe_therapeutique => { :name => "a_ct"}
        end.should change(ClasseTherapeutique, :count).by(1)
      end
      it "should redirect to the created class" do
        post :create, :classe_therapeutique => { :name => "a_ct"}
        response.should redirect_to(classe_therapeutique_path(1))
      end
    end
  end

  describe "GET 'edit'" do
    before(:each) do
      sign_in :user, Factory(:valideur)
      @ct = Factory(:classe_therapeutique)
    end
    it "should be successful" do
      get :edit, :id => @ct
      response.should be_success
    end
  end

  describe "PUT 'update'" do
    before(:each) do
      sign_in :user, Factory(:valideur)
      @ct = Factory(:classe_therapeutique, :name => "a_ct")
    end
    context "success" do
      it "should change content" do
        put :update, :id => @ct, :classe_therapeutique => { :name => "new_ct"}
        ct = assigns(:classe_therapeutique)
        @ct.reload
        @ct.name.should == ct.name
      end
    end
    context "failure" do
      it "should render the 'edit' page" do
        put :update, :id => @ct, :classe_therapeutique => { :name => ""}
        response.should render_template('edit')
      end
    end
  end

  describe "DELETE 'destroy'" do
    before(:each) do
      sign_in :user, Factory(:valideur)
      @ct = Factory(:classe_therapeutique)
    end
    it "should destroy the classe therapeutique" do
      expect do
        delete :destroy, :id => @ct
      end.should change(ClasseTherapeutique, :count).by(-1)
    end
  end
end

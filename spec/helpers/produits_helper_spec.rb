require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')
include Authorization::TestHelper
include Authorization::AuthorizationHelper

describe ProduitsHelper do
  
  before(:each) do
    helper.extend Haml
    helper.extend Haml::Helpers
    helper.send :init_haml_helpers
    activate_authlogic
    UserSession.create Factory(:user)
  end

  it "should display produit's validation date" do
    pending
    @produit = Factory(:produit)
    @produit.validation_date = Time.now.to_date
    helper.capture_haml{
      helper.validation
    }.should =~ /<p><small>(Informations validées il y a <em>environ 16 heures<\/em>)<\/small><\/p>/
  end
end

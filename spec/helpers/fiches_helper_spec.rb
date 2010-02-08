require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')
include Authorization::TestHelper
include Authorization::AuthorizationHelper

describe FichesHelper do
  
  before(:each) do
    helper.extend Haml
    helper.extend Haml::Helpers
    helper.send :init_haml_helpers
    activate_authlogic
    UserSession.create Factory(:user)
  end

  it "should display fiche's validation date" do
    pending
    @fiche = Factory(:fiche)
    @fiche.validation_date = Time.now.to_date
    helper.capture_haml{
      helper.validation
    }.should =~ /<p><small>(Informations validées il y a <em>environ 16 heures<\/em>)<\/small><\/p>/
  end
end

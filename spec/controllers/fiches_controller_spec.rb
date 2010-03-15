require File.dirname(__FILE__) + '/../spec_helper'
 
describe FichesController do
  fixtures :all
  integrate_views
  
  before(:each) do
    activate_authlogic
    UserSession.create Factory.build(:user, :role => "valideur")
  end

end

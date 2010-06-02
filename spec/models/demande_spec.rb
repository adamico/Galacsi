require File.dirname(__FILE__) + '/../spec_helper'

describe Demande do
  before(:each) do
    @demande = Demande.new    
  end
  it "should be valid" do
    @demande.name = "value for name"
    @demande.should be_valid
  end
end


# == Schema Information
#
# Table name: demandes
#
#  id         :integer         not null, primary key
#  nature     :string(255)
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#


require File.dirname(__FILE__) + '/../spec_helper'

describe Distinction do
  before(:each) do
    @distinction = Distinction.new
  end
  it "should be valid" do
    @distinction.name = "value for name"
    @distinction.should be_valid
  end
end



# == Schema Information
#
# Table name: distinctions
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#


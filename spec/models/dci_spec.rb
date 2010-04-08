require File.dirname(__FILE__) + '/../spec_helper'

describe Dci do
  before(:each) do
    @dci = Factory.build(:dci)
  end
  it "should be valid" do
    @dci.name = "value for name"
    @dci.should be_valid
  end
end



# == Schema Information
#
# Table name: dcis
#
#  id            :integer         not null, primary key
#  name          :string(255)
#  created_at    :datetime
#  updated_at    :datetime
#  stripped_name :string(255)
#


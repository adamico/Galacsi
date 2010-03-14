require File.dirname(__FILE__) + '/../spec_helper'

describe Source do
  before(:each) do
    @source = Source.new
  end
  it "should be valid" do
    @source.name = "value for name"
    @source.should be_valid
  end
end



# == Schema Information
#
# Table name: sources
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  nature     :string(255)
#  url        :string(255)
#  created_at :datetime
#  updated_at :datetime
#


require File.dirname(__FILE__) + '/../spec_helper'

describe Source do
  it "should be valid" do
    Source.new.should be_valid
  end
end

# == Schema Information
#
# Table name: sources
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  type       :string(255)
#  url        :string(255)
#  created_at :datetime
#  updated_at :datetime
#


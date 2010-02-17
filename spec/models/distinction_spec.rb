require File.dirname(__FILE__) + '/../spec_helper'

describe Distinction do
  it "should be valid" do
    Distinction.new.should be_valid
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


require File.dirname(__FILE__) + '/../spec_helper'

describe Dci do
  it "should be valid" do
    Dci.new.should be_valid
  end
end

# == Schema Information
#
# Table name: dcis
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#


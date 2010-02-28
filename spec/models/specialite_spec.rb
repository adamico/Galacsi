require File.dirname(__FILE__) + '/../spec_helper'

describe Specialite do
  it "should be valid" do
    Specialite.new.should be_valid
  end
end


# == Schema Information
#
# Table name: specialites
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#


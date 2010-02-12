require File.dirname(__FILE__) + '/../spec_helper'

describe Demande do
  it "should be valid" do
    Demande.new.should be_valid
  end
end

# == Schema Information
#
# Table name: demandes
#
#  id         :integer         not null, primary key
#  type       :string(255)
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#


require File.dirname(__FILE__) + '/../spec_helper'

describe ClasseTherapeutique do
  it "should be valid" do
    ClasseTherapeutique.new.should be_valid
  end
end


# == Schema Information
#
# Table name: classe_therapeutiques
#
#  id            :integer         not null, primary key
#  name          :string(255)
#  created_at    :datetime
#  updated_at    :datetime
#  stripped_name :string(255)
#


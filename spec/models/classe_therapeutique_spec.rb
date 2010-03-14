require File.dirname(__FILE__) + '/../spec_helper'

describe ClasseTherapeutique do
  before(:each) do
    @classe_therapeutique = ClasseTherapeutique.new
  end
  it "should be valid" do
    @classe_therapeutique.name = "value for name"
    @classe_therapeutique.should be_valid
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


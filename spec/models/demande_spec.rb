require 'spec_helper'

describe Demande do
  let(:demande) {Factory.build(:demande)}
  subject {demande}

  it {should be_valid}
  it "should require a name" do
    subject.name = ""
    subject.should_not be_valid
  end
  it "should require a unique name" do
    other_demande = Factory(:demande, :name => subject.name)
    subject.should_not be_valid
  end
end


# == Schema Information
#
# Table name: demandes
#
#  id         :integer         not null, primary key
#  nature     :string(255)
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#


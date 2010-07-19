require File.dirname(__FILE__) + '/../spec_helper'

describe Dci do
  before(:each) do
    @dci = Factory.build(:dci)
  end
  it "should be valid" do
    dci = Factory.build(:dci, :name => "value for name")
    dci.should be_valid
  end
  describe "#commercial_names" do
    it "should list the associated specialites names" do
      spec1 = Factory(:specialite, :name => "spec1")
      spec2 = Factory(:specialite, :name => "spec2")
      dci = Factory(:dci, :specialites => [spec1, spec2])
      dci.commercial_names.should == "Spec1, Spec2"
    end
  end
  describe "#assign_commercial_names" do
    it "should assign existing specialites or create them"
  end
end




# == Schema Information
#
# Table name: dcis
#
#  id                    :integer         not null, primary key
#  name                  :string(255)
#  created_at            :datetime
#  updated_at            :datetime
#  stripped_name         :string(255)
#  cached_slug           :string(255)
#  classifications_count :integer         default(0)
#  fiches_count          :integer         default(0)
#


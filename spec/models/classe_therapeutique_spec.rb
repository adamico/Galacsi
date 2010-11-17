#encoding: utf-8
require 'spec_helper'

describe ClasseTherapeutique do
  let(:classe_therapeutique) { Factory.build(:classe_therapeutique)}
  subject {classe_therapeutique}

  it {should be_valid}

  it "should require a unique name" do
    other_ct = Factory(:classe_therapeutique, :name => subject.name)
    subject.should_not be_valid
  end

  describe "before validation" do
    it "should set unicode stripped name" do
      subject.name = "époque"
      subject.save!
      subject.stripped_name.should == "epoque"
    end
  end
end



# == Schema Information
#
# Table name: classe_therapeutiques
#
#  id                    :integer         not null, primary key
#  name                  :string(255)
#  created_at            :datetime
#  updated_at            :datetime
#  stripped_name         :string(255)
#  classifications_count :integer         default(0)
#


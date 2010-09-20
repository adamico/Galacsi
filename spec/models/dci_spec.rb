#encoding: utf-8
require 'spec_helper'

describe Dci do
  let(:dci) {Factory.build(:dci)}
  subject {dci}

  it {should be_valid}

  describe "#commercial_names" do
    it "should exist" do
      subject.should respond_to(:commercial_names)
    end
    it "should list the associated specialites names" do
      spec1 = Factory(:specialite, :name => "spec1")
      spec2 = Factory(:specialite, :name => "spec2")
      subject.specialites = [spec1, spec2]
      subject.commercial_names.should == "Spec1, Spec2"
    end
  end
  describe "when saved" do
    it "should assign associated specialites using #commercial_names" do
      com_names = "cn1, cn2, cn3"
      subject.commercial_names = com_names
      subject.save!
      specialites = com_names.split(', ').map do |name|
        Specialite.find_by_name(name)
      end
      subject.specialites.should == specialites
    end
    it "should set the unicode stripped name" do
      subject.name = "époque"
      subject.save!
      subject.stripped_name.should == "epoque"
    end
  end
  describe "#classes_therapeutiques" do
    it "should exist" do
      subject.should respond_to(:classes_therapeutiques)
    end
    it "should list the associated c.t." do
      cts = []
      3.times do |i|
        cts << Factory(:classe_therapeutique, :name => "ct#{i}")
      end
      subject.classe_therapeutiques = cts
      subject.classes_therapeutiques.should == "Ct0, Ct1, Ct2"
    end
  end
end



# == Schema Information
#
# Table name: dcis
#
#  id            :integer         not null, primary key
#  name          :string(255)
#  created_at    :datetime
#  updated_at    :datetime
#  stripped_name :string(255)
#


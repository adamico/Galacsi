#encoding: utf-8
require 'spec_helper'

describe Dci do
  subject {Factory.build(:dci)}
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

  describe ".with_recent_fiches" do
    it "should return dcis with recently validated fiches" do
      dci1 = Factory(:dci)
      dci2 = Factory(:dci)
      dci3 = Factory(:dci)
      subject.save!
      subject.fiches.create(:published_at => Time.now.to_date)
      dci1.fiches.create(:published_at => 1.week.ago)
      dci2.fiches.create(:published_at => 2.week.ago)
      dci3.fiches.create(:published_at => 3.week.ago)
      Dci.with_recent_fiches.all.should == [subject, dci1, dci2]
    end
  end
  describe ".with_valid_fiches" do
    it "should return dcis with valide state fiches only" do
      dci1 = Factory(:dci)
      dci2 = Factory(:dci)
      dci3 = Factory(:dci)
      subject.save!
      subject.fiches.create(:state => "valide")
      dci1.fiches.create(:state => "valide")
      dci2.fiches.create(:state => "valide")
      dci3.fiches.create
      Dci.with_valid_fiches.all.should == [subject, dci1, dci2]
    end
  end
  describe "when saved" do
    it "should assign existing specialites or create them" do
      Factory(:specialite, :name => "spec1")
      Factory(:specialite, :name => "spec2")
      subject.commercial_names = "spec1, spec2"
      subject.save!
      subject.reload
      subject.commercial_names.should == "spec1, spec2"
    end
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


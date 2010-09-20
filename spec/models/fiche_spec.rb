require 'spec_helper'

describe Fiche do
  let(:dci) {Factory(:dci)}
  subject { dci.fiches.build}

  it { should be_valid }

  describe "when saved" do
    it "should assign alternatives" do
      #pending("failing")
      alt_names = "alt1, alt2, alt3"
      subject.alternative_names = alt_names
      subject.save!
      alts = alt_names.split(', ').map do |name|
        Dci.find_by_name(name)
      end
      subject.alternatives.should == alts
    end
  end
  describe "#full_distinction" do
    it "should exist" do
      subject.should respond_to(:full_distinction)
    end
    it "should return distinction label and name joined by ':'" do
      dist = "d_label"
      dist_name = "d_name"
      subject.distinction = Factory(:distinction, :name => dist)
      subject.distinction_name = dist_name
      subject.full_distinction.should == dist + " : " + dist_name
    end
  end

  describe "#createur" do
    it "should exist" do
      subject.should respond_to(:createur)
    end
    it "should return the name of user who created the current fiche" do
      user = Factory(:user)
      subject.user = user
      subject.createur.should == user.username
    end
  end
  describe "#alternative_names" do
    it "should exist" do
      subject.should respond_to(:alternative_names)
    end
    it "should return names of alternatives for current fiche" do
      alts = []
      3.times do |i|
        alts << Factory(:dci, :name => "name#{i}")
      end
      subject.alternatives = alts
      subject.alternative_names.should == "name0, name1, name2"
    end
  end
end



















# == Schema Information
#
# Table name: fiches
#
#  id                    :integer         not null, primary key
#  name                  :string(255)
#  created_at            :datetime
#  updated_at            :datetime
#  state                 :string(255)
#  decision_id           :integer
#  validation_date       :date
#  commentaire           :text
#  distinction_name      :text
#  dci_id                :integer
#  suivi                 :string(255)
#  revalider_le          :date
#  ei                    :text
#  conditions            :text
#  surveillance          :text
#  biodisponibilite      :string(255)
#  dose_par_rapport_dmap :string(255)
#  dose_par_rapport_dp   :string(255)
#  liaison_pp            :string(255)
#  vol_dist              :string(255)
#  tmax                  :string(255)
#  thalf                 :string(255)
#  pm                    :string(255)
#  passage_lait          :string(255)
#  rapport_lp            :string(255)
#  has_poso_pedia        :boolean
#  metabolites_actifs    :boolean
#  risque_accumulation   :boolean
#  risque_dim_lactation  :boolean
#  poso_pedia_des        :string(255)
#  arg_autre             :text
#  distinction_id        :integer
#  ei_theoriques         :text
#  de_choix              :boolean
#  pic_lacte             :string(255)
#  poso_pedia_dose       :string(255)
#  user_id               :integer
#


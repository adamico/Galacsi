require 'spec_helper'

describe Fiche do
  let(:dci) {FactoryGirl.create(:dci)}
  subject { dci.fiches.build}

  it { should be_valid }

  describe "when saved" do
    it "should assign alternatives" do
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
    context "when #distinction is nil" do
      it "should return #distinction_name only" do
        subject.distinction_id = nil
        subject.distinction_name = "dn1"
        subject.full_distinction.should == "Dn1"
      end
    end
    context "when #distinction_name is blank" do
      it "should return #distinction.name" do
        distinction = FactoryGirl.create(:distinction, :name => "dist1")
        subject.distinction_name = ""
        subject.distinction = distinction
        subject.full_distinction.should == "Dist1"
      end
    end
    it "should return distinction label and name joined by ':'" do
      dist = "dlabel"
      dist_name = "dname"
      subject.distinction = FactoryGirl.create(:distinction, :name => dist)
      subject.distinction_name = dist_name
      subject.full_distinction.should == "Dlabel : Dname"
    end
  end

  describe "#createur" do
    it "should exist" do
      subject.should respond_to(:createur)
    end
    it "should return the fiche's creator username" do
      user = FactoryGirl.create(:user)
      subject.user = user
      subject.createur.should == user.username
    end
  end

  describe "#alternative_names" do
    it "should exist" do
      subject.should respond_to(:alternative_names)
    end
    it "should return names of alternatives joined by ', '" do
      2.times do |n|
        subject.alternatives << FactoryGirl.create(:dci, :name => "dci#{n+1}")
      end
      subject.alternative_names.should == "dci1, dci2"
    end
  end
  #
  # scopes
  describe ".expired" do
    it "should return expired fiches" do
      FactoryGirl.create(:fiche, :revalider_le => 2.months.from_now)
      exp_fiche = FactoryGirl.create(:fiche_expiree)
      Fiche.expired.should == [exp_fiche]
    end
  end
  describe ".valide" do
    it "should return fiches with valide state" do
      val1 = FactoryGirl.create(:fiche_valide)
      val2 = FactoryGirl.create(:fiche_valide)
      Fiche.valide.all.should == [val1, val2]
    end
  end
  describe ".non_valide" do
    it "should return fiches with state other than 'valide'" do
      brou = FactoryGirl.create(:fiche)
      aval = FactoryGirl.create(:fiche_a_valider)
      enat = FactoryGirl.create(:fiche_en_attente)
      Fiche.non_valide.all.should == [brou, aval, enat]
    end
  end

  describe ".recent" do
    it "should return recently validated fiches only" do
      FactoryGirl.create(:fiche, :published_at => 3.weeks.ago)
      recent_fiche = FactoryGirl.create(:fiche_recente)
      Fiche.recent.should == [recent_fiche]
    end
  end
  # workflow state machine callbacks
  describe "#valider" do
    subject {FactoryGirl.create(:fiche_a_valider)}
    it "should set #published_at to today" do
      subject.valider!
      subject.reload
      subject.published_at.should == Time.now.to_date
    end
    it "should set #revalider_le to 3 months in future" do
      subject.revalider_le = nil
      subject.valider!
      subject.reload
      subject.revalider_le.should == 3.months.from_now.to_date
    end
  end
  describe "#mettre_en_attente" do
    subject {FactoryGirl.create(:fiche_valide)}
    it "should set #published_at to nil" do
      subject.mettre_en_attente!
      subject.reload
      subject.published_at.should == nil
    end
    it "should set #revalider_le to nil" do
      subject.mettre_en_attente!
      subject.reload
      subject.revalider_le.should == nil
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
# thalf                 :string(255)
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


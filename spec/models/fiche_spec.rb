require 'spec_helper'

describe Fiche do
  subject {Factory(:fiche)}
  it {should be_valid}
  describe "#full_distinction" do
    context "when #distinction is nil" do
      it "should return #distinction_name only" do
        subject.distinction_id = nil
        subject.distinction_name = "dn1"
        subject.full_distinction.should == "Dn1"
      end
    end
    context "when #distinction_name is blank" do
      it "should return #distinction.name" do
        distinction = Factory(:distinction, :name => "dist1")
        subject.distinction_name = ""
        subject.distinction = distinction
        subject.full_distinction.should == "Dist1"
      end
    end
    it "should join #distinction.name and #distinction_name with ' : '" do
      distinction = Factory(:distinction, :name => "dist1")
      subject.distinction = distinction
      subject.distinction_name = "dn1"
      subject.full_distinction.should == "Dist1 : Dn1"
    end
  end
  describe "#createur" do
    it "should return the fiche's creator username" do
      user = Factory(:user)
      subject.user = user
      subject.createur.should == user.username
    end
  end
  describe "#alternative_names" do
    it "should return names of alternatives joined by ', '" do
      2.times do |n|
        subject.alternatives << Factory(:dci, :name => "dci#{n+1}")
      end
      subject.alternative_names.should == "dci1, dci2"
    end
  end
  # scopes
  describe ".expired" do
    it "should return expired fiches" do
      Factory(:fiche, :revalider_le => 2.months.from_now)
      exp_fiche = Factory(:fiche_expiree)
      Fiche.expired.should == [exp_fiche]
    end
  end
  describe ".valide" do
    it "should return fiches with 'valide' state only" do
      Factory(:fiche)
      val_fiches = []
      3.times do
        val_fiches << Factory(:fiche_valide)
      end
      Fiche.valide.should == val_fiches
    end
  end
  describe ".non_valide" do
    it "should return all fiches where state is not 'valide'" do
      Factory(:fiche_valide)
      nval_fiches = [
        Factory(:fiche),
        Factory(:fiche_en_attente),
        Factory(:fiche_a_valider)
      ]
      Fiche.non_valide.should == nval_fiches
    end
  end
  describe ".recent" do
    it "should return recently validated fiches only" do
      Factory(:fiche, :published_at => 3.weeks.ago)
      recent_fiche = Factory(:fiche_recente)
      Fiche.recent.should == [recent_fiche]
    end
  end
  # workflow state machine callbacks
  describe "#valider" do
    subject {Factory(:fiche_a_valider)}
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
    subject {Factory(:fiche_valide)}
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


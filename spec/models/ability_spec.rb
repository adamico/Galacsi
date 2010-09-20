require 'spec_helper'
require 'cancan/matchers'

describe Ability do
  context "for a guest user:" do
    user = Factory.build :user
    subject { Ability.new(user) }

    it "should be able to read and specialite" do
      should be_able_to(:read, Specialite.new)
    end
    it "should be able to list all classes therapeutiques" do 
      should be_able_to(:index, ClasseTherapeutique.new)
    end
    it "should not be able to access c.t. not having any dci" do
      should_not be_able_to(:show, Factory(:classe_therapeutique))
    end
    it "should be able to list all dcis" do
      should be_able_to(:index, Dci.new)
    end
    it "should not be able to access dcis not having any valid fiche" do
      dci_with_no_valid_fiches = Factory(:dci)
      dci_with_no_valid_fiches.fiches.create!
      dci_with_no_valid_fiches.fiches.create!(:state => "brouillon")
      dci_with_no_valid_fiches.fiches.create!(:state => "a_valider")
      dci_with_no_valid_fiches.fiches.create!(:state => "en_attente")
      should_not be_able_to(:show, dci_with_no_valid_fiches)
    end
    it "should be able to access a dci having at least 1 valide fiche" do
      dci = Factory(:dci)
      dci.fiches.create!(:state => "valide")
      subject.should be_able_to(:show, dci)
    end
    it "should be able to read valide fiches" do
      should be_able_to(:read, Factory(:fiche_valide))
    end
    it "should be able to list stripped names for dcis" do
      should be_able_to(:stripped_names, Dci)
    end
    it "should be able to list stripped names for c.t." do
      should be_able_to(:stripped_names, ClasseTherapeutique)
    end
    it "should be able to list names for specialites" do
      should be_able_to(:names, Specialite)
    end
    it "should not be able to read fiches with states other than valide" do
      should_not be_able_to(:read, Factory(:fiche))
    end
    it "should be able to create new demandes" do
      should be_able_to(:create, Demande)
    end
  end
  context "for an admin:" do
    admin = Factory.build :user
    admin.admin = true
    subject { Ability.new(admin) }
    it "should be able to manage c.t." do
      should be_able_to(:manage, ClasseTherapeutique.new)
    end
    it "should be able to manage dci" do
      should be_able_to(:manage, Dci.new)
    end
    it "should be able to manage decision" do
      should be_able_to(:manage, Decision.new)
    end
    it "should be able to manage demande" do
      should be_able_to(:manage, Demande.new)
    end
    it "should be able to manage distinction" do
      should be_able_to(:manage, Distinction.new)
    end
    it "should be able to manage fiche" do
      should be_able_to(:manage, Fiche.new)
    end
    it "should be able to manage source" do
      should be_able_to(:manage, Source.new)
    end
    it "should be able to manage specialite" do
      should be_able_to(:manage, Specialite.new)
    end
    it "should be able to manage user" do
      should be_able_to(:manage, User.new)
    end
  end
  context "for a contributeur:" do
    contrib = Factory.build :contributeur
    subject { Ability.new(contrib) }
    it "should be able to read all c.t." do
      should be_able_to(:read, ClasseTherapeutique.new)
    end
    it "should be able to read all dcis" do
      should be_able_to(:read, Dci.new)
    end
    it "should be able to read all fiches" do
      should be_able_to(:read, Fiche.new)
    end
    it "should be able to create fiches" do
      should be_able_to(:create, Fiche)
    end
    context "for fiches he owns" do
      it "should be able to update brouillon state fiche" do
        should be_able_to(:update, Factory(:fiche, :user => contrib))
      end
      it "should be able to update a valider state fiche" do
        should be_able_to(:update, Factory(:fiche_a_valider, :user => contrib))
      end
      it "should not be able to update valid state fiches" do
        should_not be_able_to(:update, Factory(:fiche_valide, :user => contrib))
      end
      it "should not be able to update en attente state fiches" do
        should_not be_able_to(:update, Factory(:fiche_en_attente, :user => contrib))
      end
    end
    it "should not be able to create dcis" do
      should_not be_able_to(:create, Dci)
    end
    it "should not be able to modify dcis" do
      should_not be_able_to(:modify, Dci.new)
    end
    it "should not be able to create specialites" do
      should_not be_able_to(:create, Specialite)
    end
    it "should not be able to modify specialites" do
      should_not be_able_to(:modify, Specialite.new)
    end
    it "should not be able to create c.t." do
      should_not be_able_to(:create, ClasseTherapeutique)
    end
    it "should not be able to modify c.t." do
      should_not be_able_to(:modify, ClasseTherapeutique.new)
    end
    it "should be able to initialiser fiches" do
      should be_able_to(:initialiser, Factory(:fiche, :user => contrib))
    end
  end
  context "for a valideur:" do
    valideur = Factory.build :valideur
    subject { Ability.new(valideur) }

    it "should be able to manage c.t." do
      should be_able_to(:manage, ClasseTherapeutique.new)
    end
    it "should be able to manage dci" do
      should be_able_to(:manage, Dci.new)
    end
    it "should be able to manage decision" do
      should be_able_to(:manage, Decision.new)
    end
    it "should be able to manage demande" do
      should be_able_to(:manage, Demande.new)
    end
    it "should be able to manage distinction" do
      should be_able_to(:manage, Distinction.new)
    end
    it "should be able to manage fiche" do
      should be_able_to(:manage, Fiche.new)
    end
    it "should be able to manage source" do
      should be_able_to(:manage, Source.new)
    end
    it "should be able to manage specialite" do
      should be_able_to(:manage, Specialite.new)
    end

    it "should be able to read users" do
      should be_able_to(:read, User)
    end
    it "should be able to update users" do
      should be_able_to(:update, User.new)
    end
    it "should not be able to destroy users" do
      should_not be_able_to(:destroy, User.new)
    end
  end
end

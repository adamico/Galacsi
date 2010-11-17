require 'spec_helper'
require 'cancan/matchers'

describe Ability do
  context "for a guest user:" do
    user = Factory.build :user
    subject { Ability.new(user) }
    it { should be_able_to(:show, Factory(:home_page))}
    it { should be_able_to(:index, Specialite.new) }
    it "should not be able to :show a Specialite with dcis without valid fiches" do
      specialite = Factory(:specialite)
      dci = Factory(:dci)
      fiche = Factory(:fiche, :dci => dci)
      comp = Factory(:composition, :specialite  => specialite, :dci => dci)
      subject.should_not be_able_to(:show, specialite)
    end
    it { should be_able_to(:index, ClasseTherapeutique.new) }
    it "should not be able to :show a C.T. with dcis without valid fiches" do
      classe_therapeutique = Factory(:classe_therapeutique)
      dci = Factory(:dci)
      fiche = Factory(:fiche, :dci => dci)
      classification = Factory(:classification, :classe_therapeutique  => classe_therapeutique, :dci => dci)
      subject.should_not be_able_to(:show, classe_therapeutique)
    end
    it "should not be able to :show a Dci without valid fiches" do
      dci = Factory(:dci)
      fiche = Factory(:fiche, :dci => dci)
      subject.should_not be_able_to(:show, dci)
    end
    it { should be_able_to(:stripped_names, Dci.new)}
    it { should be_able_to(:stripped_names, Specialite.new)}
    it { should be_able_to(:read, Factory(:fiche_valide)) }
    it { should_not be_able_to(:read, Factory(:fiche)) }
    it { should_not be_able_to(:read, Factory(:fiche_a_valider)) }
    it { should_not be_able_to(:read, Factory(:fiche_en_attente)) }
    it { should be_able_to(:search, Factory(:fiche))}
    it { should be_able_to(:create, Demande)}
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
    it { should be_able_to(:search, Fiche)}
    it { should be_able_to(:search, Dci)}
    it { should be_able_to(:read, Source)}
    it { should be_able_to(:names, Source)}
    it { should be_able_to(:read, Page)}
    it { should be_able_to(:read, Dci)}
    it { should be_able_to(:read, ClasseTherapeutique)}
    it { should be_able_to(:read, Fiche)}
    it { should be_able_to(:read, Demande)}
    it { should be_able_to(:create, Fiche)}
    it { should be_able_to(:update, Factory(:fiche, :user => contrib))}
    it { should be_able_to(:update, Factory(:fiche_a_valider, :user => contrib))}
    it { should_not be_able_to(:update, Factory(:fiche_valide, :user => contrib))}
    it { should_not be_able_to(:update, Factory(:fiche_en_attente, :user => contrib))}
    it { should_not be_able_to(:update, Fiche.new) }
    it { should_not be_able_to(:create, Dci)}
    it { should_not be_able_to(:modify, Dci.new)}
    it { should_not be_able_to(:create, Specialite)}
    it { should_not be_able_to(:modify, Specialite.new)}
    it { should_not be_able_to(:create, ClasseTherapeutique)}
    it { should_not be_able_to(:modify, ClasseTherapeutique.new)}
  end
  context "for a valideur:" do
    let(:valideur) {Factory :valideur}
    subject { Ability.new(valideur) }
    it { should be_able_to(:search, Fiche)}
    it { should be_able_to(:search, Dci)}
    it { should be_able_to(:manage, ClasseTherapeutique)}
    it { should be_able_to(:manage, Dci) }
    it { should be_able_to(:manage, Decision) }
    it { should be_able_to(:manage, Demande) }
    it { should be_able_to(:manage, Distinction) }
    it { should be_able_to(:manage, Fiche) }
    it { should be_able_to(:manage, Source) }
    it { should be_able_to(:manage, Specialite) }
    it { should be_able_to(:read, User)}
    it { should be_able_to(:create, User)}
    it { should be_able_to(:update, User)}
    it { should_not be_able_to(:destroy, valideur)}
  end
end

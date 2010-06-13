require 'spec_helper'
require 'cancan/matchers'

describe Ability do
  context "for a guest user:" do
    user = Factory.build :user
    subject { Ability.new(user) }
    it { should be_able_to(:read, Factory(:fiche_valide)) }
    it { should_not be_able_to(:read, Factory(:fiche)) }
    it { should_not be_able_to(:read, Factory(:fiche_a_valider)) }
    it { should_not be_able_to(:read, Factory(:fiche_en_attente)) }
    it { should not_be_able_to(:read, Dci.new) }
    it { should be_able_to(:read, Factory(:dci_with_valid_fiches))}
    it { should be_able_to(:read, Specialite.new) }
    it { should be_able_to(:read, ClasseTherapeutique.new) }
  end
  context "for an admin:" do
    admin = Factory.build :user
    admin.admin = true
    subject { Ability.new(admin) }
    it { should be_able_to(:manage, ClasseTherapeutique.new)}
    it { should be_able_to(:manage, Dci.new) }
    it { should be_able_to(:manage, Decision.new) }
    it { should be_able_to(:manage, Demande.new) }
    it { should be_able_to(:manage, Distinction.new) }
    it { should be_able_to(:manage, Fiche.new) }
    it { should be_able_to(:manage, Source.new) }
    it { should be_able_to(:manage, Specialite.new) }
    it { should be_able_to(:manage, User.new) }
  end
  context "for a contributeur:" do
    contrib = Factory.build :contributeur
    subject { Ability.new(contrib) }
    it { should be_able_to(:read, ClasseTherapeutique.new)}
    it { should_not be_able_to(:create, Dci)}
    it { should_not be_able_to(:modify, Dci.new)}
    it { should_not be_able_to(:create, Specialite)}
    it { should_not be_able_to(:modify, Specialite.new)}
    it { should_not be_able_to(:create, ClasseTherapeutique)}
    it { should_not be_able_to(:modify, ClasseTherapeutique.new)}
    it { should be_able_to(:read, Fiche.new)}
    it { should be_able_to(:create, Fiche)}
    it { should be_able_to(:update, Factory(:fiche, :user => contrib))}
    it { should_not be_able_to(:update, Fiche.new) }
    it { should_not be_able_to(:update, Factory(:fiche, :user => contrib, :state => "valide")) }
    it { should_not be_able_to(:update, Factory(:fiche, :user => contrib, :state => "en_attente")) }
    it { should be_able_to(:initialiser, Factory(:fiche, :user => contrib))}
    it { should_not be_able_to(:initialiser, Factory(:fiche, :user => contrib, :state => "a_valider"))}
    it { should_not be_able_to(:initialiser, Factory(:fiche, :user => contrib, :state => "valide"))}
    it { should_not be_able_to(:initialiser, Factory(:fiche, :user => contrib, :state => "en_attente"))}
  end
  context "for a valideur:" do
    valideur = Factory.build :valideur
    subject { Ability.new(valideur) }
    it { should be_able_to(:manage, ClasseTherapeutique.new)}
    it { should be_able_to(:manage, Dci.new) }
    it { should be_able_to(:manage, Decision.new) }
    it { should be_able_to(:manage, Demande.new) }
    it { should be_able_to(:manage, Distinction.new) }
    it { should be_able_to(:manage, Fiche.new) }
    it { should be_able_to(:manage, Source.new) }
    it { should be_able_to(:manage, Specialite.new) }
    it { should_not be_able_to(:valider, Factory(:fiche, :state => "brouillon") )}
    it { should_not be_able_to(:valider, Factory(:fiche, :state => "valide") )}
    it { should be_able_to(:initialiser, Factory(:fiche, :state => "brouillon") )}
    it { should_not be_able_to(:invalider, Factory(:fiche, :state => "en_attente"))}
    it { should_not be_able_to(:invalider, Factory(:fiche, :state => "brouillon"))}
    it { should_not be_able_to(:invalider, Factory(:fiche, :state => "a_valider"))}
    it { should_not be_able_to(:maj_date, Factory(:fiche, :state => "en_attente"))}
    it { should_not be_able_to(:maj_date, Factory(:fiche, :state => "brouillon"))}
    it { should_not be_able_to(:maj_date, Factory(:fiche, :state => "a_valider"))}
    it { should be_able_to(:read, User)}
    it { should be_able_to(:update, User.new)}
    it { should_not be_able_to(:destroy, User.new)}
  end
end

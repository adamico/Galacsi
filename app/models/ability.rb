class Ability
  include CanCan::Ability

  def initialize(user)
    guest = User.new
    guest.role = ""
    user ||= guest
    if user.admin?
      can :manage, :all
    end
    case user.role
    when "contributeur"
      can :read, [ClasseTherapeutique, Fiche]
      can :create, Fiche
      can :update, Fiche, :state => ["brouillon", "a_valider"], :user_id => user.id
      can :manage, [Dci, Specialite, ClasseTherapeutique] do |action, object_class|
        action != :destroy
      end
      can :initialiser, Fiche, :state => "brouillon", :user_id => user.id
    when "valideur"
      can :manage, User do |action, object_class|
        action != :destroy
      end
      can :manage, [Dci, Fiche, Demande, Specialite, Decision, Distinction, Source, ClasseTherapeutique]
      can :valider, Fiche, :state => ["en_attente", "a_valider"]
      can [:invalider, :maj_date], Fiche, :state => ["valide"]
    else
      can :read, Fiche, :state => ["en_attente", "valide"]
      can [:read, :search], [Dci, Specialite, ClasseTherapeutique]
    end
  end
end

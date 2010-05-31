class Ability
  include CanCan::Ability

  def initialize(user)
    guest = User.new
    guest.role = ""
    user ||= guest
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
      can [:read, :update], User
      can :manage, [Dci, Fiche, Demande, Specialite, Decision, Distinction, Source, ClasseTherapeutique]
      can :valider, Fiche, :state => ["en_attente", "a_valider"]
      can [:invalider, :maj_date], Fiche, :state => ["valide"]
    when "admin"
      can :manage, :all
    else
      can :read, Fiche, :state => ["en_attente", "valide"]
      can :read, [Dci, Specialite, ClasseTherapeutique]
    end
  end
end

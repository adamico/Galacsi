class Ability
  include CanCan::Ability

  def initialize(user)
    alias_action :update, :destroy, :to => :modify
    guest = User.new
    guest.role = ""
    user ||= guest
    
    # guest abilities
    can :read, Specialite
    can :index, ClasseTherapeutique
    can :show, ClasseTherapeutique do |ct|
      ct && !ct.dcis.empty?
    end

    can :index, Dci
    can :show, Dci do |dci|
      dci && !dci.fiches.valide.empty?
    end
    can :stripped_names, [Dci, ClasseTherapeutique]
    can :names, Specialite

    can :read, Fiche, :state => "valide"

    can :create, Demande

    # admin abilities
    if user.admin?
      can :manage, :all
    # other roles abilities
    else
      case user.role
      when "contributeur"
        can :read, [Dci, ClasseTherapeutique, Fiche]
        can :create, Fiche
        can :update, Fiche,
          :state => ["brouillon", "a_valider"],
          :user_id => user.id
        can :initialiser, Fiche, :state => "brouillon", :user_id => user.id
      when "valideur"
        can :manage, User do |action, object_class|
          action != :destroy
        end
        can :manage, [Dci, Fiche, Demande, Specialite, Decision, Distinction, Source, ClasseTherapeutique]
        can :valider, Fiche, :state => ["en_attente", "a_valider"]
        can [:invalider, :maj_date], Fiche, :state => ["valide"]
      end
    end
  end

end

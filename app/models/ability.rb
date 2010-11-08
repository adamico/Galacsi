class Ability
  include CanCan::Ability

  def initialize(user)
    alias_action :update, :destroy, :to => :modify
    guest = User.new
    guest.role = ""
    user ||= guest

    # guest abilities
    can :show, Page
    can :index, Specialite
    can :show, Specialite do |sp|
      !sp.dcis.with_valid_fiches.empty?
    end
    can :index, ClasseTherapeutique
    can :show, ClasseTherapeutique do |ct|
      !ct.dcis.with_valid_fiches.empty?
    end

    can :show, Dci do |dci|
      !dci.fiches.valide.empty?
    end
    can :stripped_names, [Dci, Specialite]
    can :names, Specialite

    can :read, Fiche, :state => "valide"
    can :search, Fiche

    can :create, Demande

    # admin abilities
    if user.admin?
      can :manage, :all
      can :search, [Fiche, Dci]
    # other roles abilities
    else
      case user.role
      when "contributeur"
        can :search, [Fiche, Dci]
        can [:read, :names], Source
        can :read, Page
        can :read, [Dci, ClasseTherapeutique, Fiche]
        can :create, Fiche
        can :update, Fiche,
          :state => ["brouillon", "a_valider"],
          :user_id => user.id
        can :initialiser, Fiche,
          :state => "brouillon",
          :user_id => user.id
      when "valideur"
        can :search, [Fiche, Dci]
        can :manage, User do |action, object_class|
          action != :destroy
        end
        can :manage, [Dci, Fiche, Demande, Specialite, Decision, Distinction, Source, ClasseTherapeutique, Page]
        can :names, Source
        can :valider, Fiche, :state => ["en_attente", "a_valider"]
        can [:invalider, :maj_date], Fiche, :state => ["valide"]
      end
    end
  end

end

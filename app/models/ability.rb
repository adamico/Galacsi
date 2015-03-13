class Ability
  include CanCan::Ability

  def initialize(user)
    alias_action :update, :destroy, :to => :modify
    guest = User.new
    guest.role = ""
    user ||= guest

    # guest abilities
    can :show, Page

    can :read, Specialite, dcis: { fiches: { state: 'valide' } }

    can :index, ClasseTherapeutique
    can :show, ClasseTherapeutique do |ct|
      ct.dcis.with_valid_fiches.any?
    end

    can :read, Dci, fiches: { state: 'valide' }

    can :read, Fiche, state: 'valide'
    can :search, Fiche

    can :create, Demande

    # admin abilities
    if user.admin?
      can :manage, :all
      cannot :destroy, user

    # other roles abilities
    else
      case user.role
      when "contributeur"
        can :search, [Fiche, Dci]
        can :read, [Page, Dci, ClasseTherapeutique, Fiche, Demande, Source]
        can :names, Source
        can :create, Fiche
        can :update, Fiche,
          :state => ["brouillon", "a_valider"],
          :user_id => user.id
      when "valideur"
        can :search, [Fiche, Dci]
        can :manage, :all
        cannot :destroy, User, :id => user.id
        can :names, Source
        can :stripped_names, [Dci, Specialite]
      end
    end
  end

end

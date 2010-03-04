authorization do
  role :admin do
    has_permission_on [ :classe_therapeutiques, :dcis, :decisions, :demandes, :distinctions, :fiches, :sources, :specialites, :users], :to => :manage
    has_permission_on :authorization_rules, :to => :read
    has_permission_on :authorization_usages, :to => :read
  end

  role :guest do
    has_permission_on :fiches, :to => :read do
      if_attribute :state => ["en_attente", "valide"]
    end
    has_permission_on [:dcis, :specialites, :classe_therapeutiques], :to => :read
  end

  role :contributeur do
    has_permission_on :classe_therapeutiques, :to => :read
    has_permission_on [ :dcis, :demandes, :specialites ], :to => [:create, :read, :update]
    has_permission_on :fiches, :to => [:create, :read]
    has_permission_on :fiches, :to => :update do
      if_attribute :state => ["brouillon", "a_valider"], :user_id => is {user.id}
    end
    has_permission_on :fiches, :to => :initialiser do
      if_attribute :state => "brouillon", :user_id => is {user.id}
    end
  end

  role :valideur do
    includes :contributeur
    has_permission_on [:dcis, :fiches, :demandes, :specialites], :to => [:update, :delete]
    has_permission_on [:decisions, :distinctions, :sources, :classe_therapeutiques], :to => :manage
    has_permission_on :fiches, :to => :valider do
      if_attribute :state => ["en_attente", "a_valider"]
    end
    has_permission_on :fiches, :to => [:invalider, :maj_date] do
      if_attribute :state => "valide"
    end
    has_permission_on :users, :to => [:create, :read, :update]
  end
end

privileges do
  privilege :manage,  :includes => [:create, :read, :update, :delete]
  privilege :read,    :includes => [:index, :show]
  privilege :create,  :includes => :new
  privilege :update,  :includes => :edit
  privilege :delete,  :includes => :destroy
end

authorization do
  role :admin do
    has_permission_on [:produits, :users], :to => :manage
    has_permission_on :produits, :to => :validate
    has_permission_on :authorization_rules, :to => :read
    has_permission_on :authorization_usages, :to => :read
  end

  role :guest do
    has_permission_on :produits, :to => :read do
      if_attribute :validation => 2 # validated produits only
    end
    has_permission_on :authorization_rules, :to => :read
    has_permission_on :authorization_usages, :to => :read
  end

  role :contributeur do
    has_permission_on :produits, :to => :create
    has_permission_on :produits, :to => :read do
      if_attribute :validation => [0, 1, 2]
    end
    has_permission_on :produits, :to => :update do
      if_attribute :validation => [0, 1] # draft, to_be_validated produit
    end
    has_permission_on :produits, :to => :validate do
      if_attribute :validation => 0
    end
  end

  role :valideur do
    has_permission_on :produits, :to => :manage
    has_permission_on :produits, :to => :validate do
      if_attribute :validation => [0, 1]
    end
    has_permission_on :produits, :to => :freeze do
      if_attribute :validation => 2
    end
    has_permission_on :produits, :to => :thaw do
      if_attribute :validation => 3
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

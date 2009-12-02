authorization do
  role :admin do
    has_permission_on [:produits, :users], :to => :manage
    has_permission_on :produits, :to => [:validate, :nonvalidated]
  end

  role :guest do
    has_permission_on [:produits], :to => :read
  end

  role :contributeur do
    includes :guest
    has_permission_on [:produits], :to => [:create, :nonvalidated]
    has_permission_on [:produits], :to => :update do
      if_attribute :user => is { user }
    end
  end

  role :valideur do
    has_permission_on [:produits], :to => :manage
    has_permission_on [:produits], :to => [:validate, :nonvalidated]
  end

  role :saisisseur do
    includes :valideur
  end
end

privileges do
  privilege :manage, :includes => [:create, :read, :update, :delete]
  privilege :read, :includes => [:index, :show]
  privilege :create, :includes => :new
  privilege :update, :includes => :edit
  privilege :delete, :includes => :destroy
end

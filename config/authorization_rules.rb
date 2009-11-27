authorization do
  role :admin do
    has_permission_on [:produits, :users], :to => :manage
    has_permission_on :produits, :to => [:validate, :nonvalidated]
  end

  role :guest do
    has_permission_on [:produits], :to => [:index, :show]
  end

  role :contributeur do
    includes :guest
    has_permission_on [:produits], :to => [:new, :create]
    has_permission_on [:produits], :to => [:edit, :update] do
      if_attribute :user => is { user }
    end
  end

  role :valideur do
    includes :contributeur
    has_permission_on [:produits], :to => [:destroy, :validate, :nonvalidated]
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

class User < ActiveRecord::Base
  devise :database_authenticatable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :role, :username, :email, :password, :password_confirmation

  has_many :fiches

  ROLES = %w[valideur contributeur]

  def role_symbols
    [role.to_sym]
  end

  def name
    username
  end
end

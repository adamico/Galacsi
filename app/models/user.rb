class User < ActiveRecord::Base
  devise :database_authenticatable, :trackable, :validatable

  has_many :fiches

  ROLES = %w[valideur contributeur]

  def role_symbols
    [role.to_sym]
  end

  def name
    username
  end
end

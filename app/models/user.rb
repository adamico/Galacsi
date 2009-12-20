class User < ActiveRecord::Base
  acts_as_authentic

  ROLES = %w[admin valideur contributeur]

  def role_symbols
    [role.to_sym]
  end
end

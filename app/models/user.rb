class User < ActiveRecord::Base
  acts_as_authentic
  has_many :assignments
  has_many :roles, :through => :assignments

  #TODO créer un attribute "date_de_validation" qui correspond à la date à laquelle les infos ont été révérifiées (avec ou sans modifications)
  def role_symbols
    roles.map do |role|
      role.name.underscore.to_sym
    end
  end

  def role_names
    names = roles.map do |role|
      role.name
    end
    names.to_sentence
  end
end

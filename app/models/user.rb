class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :http_authenticatable, :token_authenticatable, :confirmable, :lockable, :timeoutable and :activatable
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


# == Schema Information
# Schema version: 20101021093522
#
# Table name: users
#
#  id                 :integer         primary key
#  email              :string(255)     default(""), not null
#  encrypted_password :string(128)     default(""), not null
#  password_salt      :string(255)     default(""), not null
#  sign_in_count      :integer         default(0)
#  current_sign_in_at :timestamp
#  last_sign_in_at    :timestamp
#  current_sign_in_ip :string(255)
#  last_sign_in_ip    :string(255)
#  username           :string(255)
#  role               :string(255)
#  created_at         :timestamp
#  updated_at         :timestamp
#  admin              :boolean
#


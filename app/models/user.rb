class User < ActiveRecord::Base
  acts_as_authentic
  has_many :assignments
  has_many :roles, :through => :assignments
end

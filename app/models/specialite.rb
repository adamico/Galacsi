class Specialite < ActiveRecord::Base
  has_many :compositions, :dependent => :destroy
  has_many :dcis, :through => :compositions
end

# == Schema Information
#
# Table name: specialites
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#


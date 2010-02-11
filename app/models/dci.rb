class Dci < ActiveRecord::Base
  validates_presence_of :name
  validates_uniqueness_of :name
  
  has_many :fiches
  
end

# == Schema Information
#
# Table name: dcis
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#


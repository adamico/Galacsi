class ClasseTherapeutique < ActiveRecord::Base
  validates_uniqueness_of :name
  
  has_many :classifications, :dependent => :destroy
  has_many :dcis, :through => :classifications
end

# == Schema Information
#
# Table name: classe_therapeutiques
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#


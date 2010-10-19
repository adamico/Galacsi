class Source < ActiveRecord::Base
  has_many :fiches, :through => :sourcings
  has_many :sourcings, :dependent => :destroy
  
  validates_presence_of :name
end



# == Schema Information
#
# Table name: sources
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  nature     :string(255)
#  url        :string(255)
#  created_at :datetime
#  updated_at :datetime
#


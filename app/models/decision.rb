class Decision < ActiveRecord::Base
  validates_presence_of :name
  
  has_many :fiches
end



# == Schema Information
#
# Table name: decisions
#
#  id          :integer         not null, primary key
#  name        :string(255)
#  description :text
#  created_at  :datetime
#  updated_at  :datetime
#  abbr        :string(255)
#


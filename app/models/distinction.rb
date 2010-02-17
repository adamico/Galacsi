class Distinction < ActiveRecord::Base
  validates_presence_of :name
  has_many :fiches
end


# == Schema Information
#
# Table name: distinctions
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#


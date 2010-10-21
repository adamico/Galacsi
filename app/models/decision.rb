# == Schema Information
# Schema version: 20101021093522
#
# Table name: decisions
#
#  id          :integer         primary key
#  name        :string(255)
#  description :text
#  created_at  :timestamp
#  updated_at  :timestamp
#  abbr        :string(255)
#

class Decision < ActiveRecord::Base
  validates_presence_of :name
  
  has_many :fiches
end






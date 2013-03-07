class Distinction < ActiveRecord::Base
  attr_accessible :name
  validates_presence_of :name
  has_many :fiches
end




# == Schema Information
# Schema version: 20101021093522
#
# Table name: distinctions
#
#  id         :integer         primary key
#  name       :string(255)
#  created_at :timestamp
#  updated_at :timestamp
#


# == Schema Information
# Schema version: 20101021093522
#
# Table name: sources
#
#  id         :integer         primary key
#  name       :string(255)
#  nature     :string(255)
#  url        :string(255)
#  created_at :timestamp
#  updated_at :timestamp
#

class Source < ActiveRecord::Base
  has_many :fiches, :through => :sourcings
  has_many :sourcings, :dependent => :destroy
  
  validates_presence_of :name
end




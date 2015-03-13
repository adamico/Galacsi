class Distinction < ActiveRecord::Base
  attr_accessible :name

  has_many :fiches
  validates_presence_of :name
end

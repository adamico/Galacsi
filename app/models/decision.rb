class Decision < ActiveRecord::Base
  attr_accessible :name, :description, :abbr
  validates_presence_of :name

  has_many :fiches
end

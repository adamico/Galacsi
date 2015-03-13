class Decision < ActiveRecord::Base
  attr_accessible :name, :abbr, :description

  has_many :fiches
  validates_presence_of :name
end

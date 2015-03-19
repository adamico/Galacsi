class Decision < ActiveRecord::Base
  attr_accessible :name, :abbr, :description

  has_many :fiches
  validates :name, presence: true
end

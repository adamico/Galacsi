class Distinction < ActiveRecord::Base
  attr_accessible :name

  has_many :fiches
  validates :name, presence: true
end

class Distinction < ActiveRecord::Base
  has_many :fiches
  validates :name, presence: true
end

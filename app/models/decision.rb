class Decision < ActiveRecord::Base
  validates :name, presence: true
  has_many :fiches
end

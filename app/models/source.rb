class Source < ActiveRecord::Base
  attr_accessible :name, :nature, :url
  has_many :fiches, through: :sourcings
  has_many :sourcings, dependent: :destroy

  validates :name, presence: true
end

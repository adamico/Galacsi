class ClasseTherapeutique < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged

  attr_accessible :name, :slug
  validates :name, presence: true, uniqueness: true
  paginates_per 10

  has_many :classifications, dependent: :destroy
  has_many :dcis, through: :classifications, order: :slug
end

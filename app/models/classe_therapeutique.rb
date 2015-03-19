class ClasseTherapeutique < ActiveRecord::Base
  extend FriendlyId
  attr_accessible :name

  friendly_id :name, use: [:slugged, :finders]

  validates_presence_of :name
  validates_uniqueness_of :name

  has_many :classifications, dependent: :destroy
  has_many :dcis, through: :classifications

  def self.by_name
    order('classe_therapeutiques.slug ASC')
  end

  def dcis_with_fiches
    dcis.includes(:fiches)
  end
end

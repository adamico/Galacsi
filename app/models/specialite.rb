class Specialite < ActiveRecord::Base
  extend FriendlyId
  attr_accessible :name

  validates :name, presence: true, uniqueness: true

  friendly_id :name, use: [:slugged, :finders]

  has_many :compositions, dependent: :destroy
  has_many :dcis, through: :compositions

  def self.with_name(name)
    where('specialites.slug LIKE ?', "#{name}%")
  end

  def self.by_name
    order("specialites.slug ASC")
  end

  def id_and_name
    { name: name }
  end

  def to_s
    name
  end
end

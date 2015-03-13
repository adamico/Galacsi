class Source < ActiveRecord::Base
  attr_accessible :name, :nature, :url

  has_many :fiches, through: :sourcings
  has_many :sourcings, dependent: :destroy

  validates :name, presence: true

  def self.by_name
    order("LOWER(sources.name) ASC")
  end

  def self.with_name(name)
    where('name LIKE ?', "%#{name}%")
  end
end

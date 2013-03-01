class Specialite < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged

  attr_accessible :name, :slug

  has_many :compositions, :dependent => :destroy
  has_many :dcis, :through => :compositions

  def name_and_name
    {id: name, text: name}
  end

  def self.with_slug(string)
    where("slug like ?", "%#{string}%")
  end
end

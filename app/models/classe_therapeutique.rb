class ClasseTherapeutique < ActiveRecord::Base
  require 'active_support'
  attr_accessible :name, :striped_name

  validates_presence_of :name
  validates_uniqueness_of :name

  has_many :classifications, dependent: :destroy
  has_many :dcis, through: :classifications

  before_validation :set_unicode_stripped_name

  default_scope { order("name ASC") }

  def dcis_with_fiches
    dcis.includes(:fiches)
  end

  def set_unicode_stripped_name
    self.stripped_name ||= strip_unicode(self.name) if self.name
  end

  def strip_unicode(string)
    mb_string = ActiveSupport::Multibyte::Chars.new(string)
    mb_string.normalize(:kd).gsub(/[^\x00-\x7F]/,'').to_s
  end
end

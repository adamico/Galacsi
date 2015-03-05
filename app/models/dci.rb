class Dci < ActiveRecord::Base
  extend FriendlyId

  require 'active_support'
  validates :name, :presence => true, :uniqueness => true

  # use the "name" column as the basis of the friendly_id, and use slugs
  friendly_id :name, use: [:slugged, :finders]

  has_many :fiches, :dependent => :destroy
  has_many :classifications, :dependent => :destroy
  has_many :classe_therapeutiques, :through => :classifications
  has_many :compositions, :dependent => :destroy
  has_many :specialites, :through => :compositions

  attr_writer :commercial_names
  after_save :assign_commercial_names

  before_validation :set_unicode_stripped_name

  scope :with_recent_fiches, -> { joins(:fiches).merge(Fiche.recent) }

  scope :with_valid_fiches, -> { joins(:fiches).merge(Fiche.valide) }

  delegate :stripped_name, :to => :dci, :prefix => true

  def classes_therapeutiques
    @classes_therapeutiques || classe_therapeutiques.map(&:name).map(&:humanize).join(', ')
  end

  def commercial_names
    @commercial_names || specialites.map(&:name).map(&:humanize).join(', ')
  end

  private

  def set_unicode_stripped_name
    self.stripped_name ||= strip_unicode(self.name.downcase) if self.name
  end

  def strip_unicode(string)
    mb_string = ActiveSupport::Multibyte::Chars.new string
    mb_string.normalize(:kd).gsub(/[^\x00-\x7F]/,'').to_s
  end

  def assign_commercial_names
    if @commercial_names
      self.specialites = @commercial_names.split(', ').map do |name|
        Specialite.find_or_create_by_name(name)
      end
    end
  end

end





# == Schema Information
# Schema version: 20101021093522
#
# Table name: dcis
#
#  id                    :integer         primary key
#  name                  :string(255)
#  created_at            :timestamp
#  updated_at            :timestamp
#  stripped_name         :string(255)
#  cached_slug           :string(255)
#  classifications_count :integer         default(0)
#  fiches_count          :integer         default(0)
#


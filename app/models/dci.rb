class Dci < ActiveRecord::Base
  attr_accessible :name, :commercial_names, :classe_therapeutique_ids
  extend FriendlyId

  require 'active_support'
  validates :name, presence: true, uniqueness: true

  friendly_id :name, use: [:slugged, :finders]

  has_many :fiches, dependent: :destroy
  has_many :classifications, dependent: :destroy
  has_many :classe_therapeutiques, through: :classifications
  has_many :compositions, dependent: :destroy
  has_many :specialites, through: :compositions

  attr_writer :commercial_names
  after_save :assign_commercial_names

  before_validation :set_unicode_stripped_name

  def self.with_recent_fiches
    joins(:fiches).merge(Fiche.recent)
  end

  scope :with_valid_fiches, -> { joins(:fiches).merge(Fiche.valide) }

  def self.by_name
    order("LOWER(dcis.stripped_name) ASC")
  end

  def self.with_name(name)
    where('stripped_name LIKE ?', "%#{name}%")
  end

  def self.with_classes_and_specialites
    includes(:classe_therapeutiques, :specialites)
  end

  def fiches_valides
    fiches.includes(:decision, :alternatives, :sources, :user, :distinction).valide
  end

  def fiches_non_valides
    fiches.includes(:decision, :alternatives, :sources, :user, :distinction).non_valide
  end

  def classes_therapeutiques
    @classes_therapeutiques ||= classe_therapeutiques.map(&:name).map(&:humanize).join(', ')
  end

  def commercial_names
    @commercial_names ||= specialites.map(&:name).map(&:humanize).join(', ')
  end

  def id_and_name
    { name: name }
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

class Dci < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged

  #attr_accessible
  validates :name, :presence => true, :uniqueness => true


  has_many :fiches, :dependent => :destroy
  has_many :classifications, :dependent => :destroy
  has_many :classe_therapeutiques, :through => :classifications
  has_many :compositions, :dependent => :destroy
  has_many :specialites, :through => :compositions

  attr_writer :commercial_names
  after_save :assign_commercial_names

  scope :with_recent_fiches,
    joins(:fiches).merge(Fiche.recent)

  scope :with_valid_fiches,
    joins(:fiches).merge(Fiche.valide)

  def self.with_slug(string)
    where("slug like ?", "%#{string}%")
  end

  def name_and_name
    {id: name, text: name}
  end

  def classes_therapeutiques
    @classes_therapeutiques || classe_therapeutiques.map(&:name).map(&:humanize).join(', ')
  end

  def commercial_names
    @commercial_names || specialites.map(&:name).map(&:humanize).join(', ')
  end

  private

  def assign_commercial_names
    if @commercial_names
      self.specialites = @commercial_names.split(', ').map do |name|
        Specialite.find_or_create_by_name(name)
      end
    end
  end

end

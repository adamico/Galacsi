class Fiche < ActiveRecord::Base
  attr_reader :createur
  attr_writer :alternative_names

  # constants
  SUIVIS = %w[oui non]
  DIPR = ["DMAP", "dose pédiatrique"]
  PASSAGE = ["dose dépendant", "inconnu", "faible"]
  RLP = ["<1", ">1"]
  STATES = [["brouillon", "brouillon"], ["à valider", "a_valider"], ["valide", "valide"], ["en attente", "en_attente"]]
  REVALIDER =
    [['3 mois', 3.months.from_now.to_date],
     ['6 mois', 6.months.from_now.to_date],
     ['1 an', 1.year.from_now.to_date]]

  # associations
  belongs_to :decision
  belongs_to :dci, counter_cache: true
  belongs_to :distinction
  belongs_to :user

  has_many :alternativeships, dependent: :destroy
  has_many :alternatives, -> { includes(:specialites) }, through: :alternativeships

  has_many :sourcings, dependent: :destroy
  has_many :sources, through: :sourcings

  accepts_nested_attributes_for :sourcings,
    reject_if: :all_blank, allow_destroy: true

  # delegations
  delegate :name, to: :dci, allow_nil: true, prefix: true
  delegate :name, :abbr, to: :decision, allow_nil: true, prefix: true

  # scopes
  def self.expired
    includes(:distinction, :dci).where("revalider_le <= ?", Time.now.to_date)
  end

  def self.valide
    where(state: 'valide')
  end

  def self.non_valide
    where.not(state: 'valide')
  end

  def self.recent
    where('published_at >= ?', 2.weeks.ago)
  end

  # callbacks
  after_save :assign_alternatives

  # state machines
  ### default state machine 'state'
  state_machine :initial => :brouillon do

    after_transition any => :valide do |fiche, transition|
      fiche.publish!
    end

    after_transition any => :en_attente do |fiche, transition|
      fiche.revoke!
    end

    event :initialiser do
      transition :brouillon => :a_valider
    end

    event :valider do
      transition [:a_valider, :en_attente] => :valide
    end

    event :mettre_en_attente do
      transition :valide => :en_attente
    end
  end

  ### 'published_at' state machine
  state_machine :published_at, :initial => :unpublished do
    event :publish do
      transition all => :published
    end
    event :revoke do
      transition all => :unpublished
    end
    state :unpublished, :value => nil
    state :published,
      :if => lambda {|value| !value.nil?},
      :value => lambda {Time.now.to_date}
    before_transition any => :published do |fiche, transition|
      fiche.revalider_le = 3.months.from_now.to_date
    end
    before_transition any => :unpublished do |fiche, transition|
      fiche.revalider_le = nil
    end
  end

  # comma CSV support
  comma do
    dci :name => "DCI"
    full_distinction 'Distinction'
    decision :name => "Décision"
    state 'Validation'
    createur
  end

  def self.with_distinction_and_dci
    includes(:distinction, :dci)
  end

  # custom methods
  def expired?
    unless published_at.nil?
      revalider_le <= Time.now.to_date
    end
  end

  def full_distinction
    dist = []
    dist << distinction.name.humanize if distinction
    dist << distinction_name.humanize unless distinction_name.blank?
    dist.join(" : ")
  end

  def createur
    @createur ||= User.find(user_id).username
  end

  def alternative_names
    @alternative_names ||= alternatives.map(&:name).join(', ')
  end

  private

  def assign_alternatives
    if @alternative_names
      self.alternatives = @alternative_names.split(', ').map do |name|
        Dci.find_or_create_by(name: name)
      end
    end
  end
end

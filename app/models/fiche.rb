# encoding: utf-8
class Fiche < ActiveRecord::Base
  belongs_to :decision
  belongs_to :dci, :counter_cache => true
  belongs_to :distinction
  belongs_to :user

  has_many :alternativeships, :dependent => :destroy
  has_many :alternatives, :through => :alternativeships
  has_and_belongs_to_many :sources, :join_table => "fiches_sources"
  accepts_nested_attributes_for :sources,
    :reject_if => proc { |attrs| attrs[:name].blank? },
    :allow_destroy => true

  delegate :name, :to => :dci, :allow_nil => true, :prefix => true

  attr_protected :state_event
  attr_reader :createur
  attr_writer :alternative_names

  after_save :assign_alternatives

  def full_distinction
    dist = []
    dist << distinction.name.humanize if distinction
    dist << distinction_name.humanize unless distinction_name.blank?
    dist.join(" : ")
  end

  def createur
    @createur || User.find(user_id).username
  end

  def alternative_names
    @alternative_names || alternatives.map(&:name).join(', ')
  end

  SUIVIS = %w[oui non]
  DIPR = ["DMAP", "dose pédiatrique"]
  PASSAGE = ["dose dépendant", "inconnu", "faible"]
  RLP = ["<1", ">1"]

  scope :expired,    where("revalider_le <= ?", Time.now.to_date)
  scope :valide,     where("state = ?", "valide")
  scope :non_valide, where("state != ?", "valide")
  scope :recent,     where("validation_date >= ?", 02.weeks.ago)

  # state machine stuff
  STATES = [["brouillon", "brouillon"], ["à valider", "a_valider"], ["valide", "valide"], ["en attente", "en_attente"]]
  state_machine :initial => :brouillon do
    #aasm_column :state
    #aasm_initial_state :brouillon

    #aasm_state :brouillon
    #aasm_state :a_valider
    #aasm_state :valide
    #aasm_state :en_attente

    event :initialiser do
      transition :brouillon => :a_valider
    end

    event :valider do
      transition [:a_valider, :en_attente] => :valide
    end

    event :invalider do
      transition :valide => :en_attente
    end
  end

  private

  def assign_alternatives
    if @alternative_names
      self.alternatives = @alternative_names.split(', ').map do |name|
        Dci.find_or_create_by_name(name)
      end
    end
  end
end



# == Schema Information
#
# Table name: fiches
#
#  id                    :integer         not null, primary key
#  name                  :string(255)
#  created_at            :datetime
#  updated_at            :datetime
#  state                 :string(255)
#  decision_id           :integer
#  validation_date       :date
#  commentaire           :text
#  distinction_name      :text
#  dci_id                :integer
#  suivi                 :string(255)
#  revalider_le          :date
#  ei                    :text
#  conditions            :text
#  surveillance          :text
#  biodisponibilite      :string(255)
#  dose_par_rapport_dmap :string(255)
#  dose_par_rapport_dp   :string(255)
#  liaison_pp            :string(255)
#  vol_dist              :string(255)
#  tmax                  :string(255)
#  thalf                 :string(255)
#  pm                    :string(255)
#  passage_lait          :string(255)
#  rapport_lp            :string(255)
#  has_poso_pedia        :boolean
#  metabolites_actifs    :boolean
#  risque_accumulation   :boolean
#  risque_dim_lactation  :boolean
#  poso_pedia_des        :string(255)
#  arg_autre             :text
#  distinction_id        :integer
#  ei_theoriques         :text
#  de_choix              :boolean
#  pic_lacte             :string(255)
#  poso_pedia_dose       :string(255)
#  user_id               :integer
#


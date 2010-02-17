#encoding: utf-8
class Fiche < ActiveRecord::Base
  validates_presence_of :dci_id
  belongs_to :decision
  belongs_to :dci
  belongs_to :distinction
  has_many :alternativeships, :dependent => :destroy
  has_many :alternatives, :through => :alternativeships

  attr_writer :alternative_names
  after_save :assign_alternative_names

  def alternative_names
    @alternative_names || alternatives.map(&:name).join(', ')
  end

  SUIVIS = %w[oui non]
  DIPR = ["DMAP", "dose pédiatrique"]
  PASSAGE = ["dose dépendant", "inconnu", "faible"]
  RLP = ["<1", ">1"]

  alias_scope :expired, lambda { revalider_le_before(Time.now.to_date)}

  # AASM stuff
  include AASM
  aasm_column :state
  aasm_initial_state :brouillon

  aasm_state :brouillon
  aasm_state :a_valider
  aasm_state :valide
  aasm_state :en_attente

  aasm_event :initialiser do
    transitions :to => :a_valider, :from => [:brouillon]
  end

  aasm_event :valider do
    transitions :to => :valide, :from => [:a_valider, :en_attente]
  end

  aasm_event :invalider do
    transitions :to => :en_attente, :from => [:valide]
  end

  private
  def assign_alternative_names
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
#  id                       :integer         not null, primary key
#  name                     :string(255)
#  created_at               :datetime
#  updated_at               :datetime
#  state                    :string(255)
#  decision_id              :integer
#  validation_date          :date
#  commentaire              :text
#  distinction_name         :text
#  dci_id                   :integer
#  suivi                    :string(255)
#  revalider_le             :date
#  ei                       :text
#  conditions               :text
#  surveillance             :text
#  biodisponibilite         :string(255)
#  dose_ingeree             :string(255)
#  dose_ingeree_par_rapport :string(255)
#  liaison_pp               :string(255)
#  vol_dist                 :string(255)
#  tmax                     :string(255)
#  thalf                    :string(255)
#  pm                       :string(255)
#  passage_lait             :string(255)
#  rapport_lp               :string(255)
#  poso_pedia               :boolean
#  metabolites_actifs       :boolean
#  risque_accumulation      :boolean
#  risque_dim_lactation     :boolean
#  poso_pedia_des           :string(255)
#  arg_autre                :text
#  distinction_id           :integer
#


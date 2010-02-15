#encoding: utf-8
class Fiche < ActiveRecord::Base
  validates_presence_of :dci_id
  belongs_to :decision
  belongs_to :dci
  has_many :alternativeships, :dependent => :destroy
  has_many :alternatives, :through => :alternativeships

  attr_writer :alternative_names
  after_save :assign_alternative_names

  def alternative_names
    @alternative_names || alternatives.map(&:name).(&:humanize).join(', ')
  end

  DISTINCTIONS = %w[indication voie dosage]
  SUIVIS = %w[oui non]

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
#  id               :integer         not null, primary key
#  name             :string(255)
#  created_at       :datetime
#  updated_at       :datetime
#  state            :string(255)
#  decision_id      :integer
#  validation_date  :date
#  commentaire      :text
#  distinction      :text
#  distinction_type :text
#  dci_id           :integer
#  suivi            :string(255)
#  revalider_le     :date
#  ei               :text
#  conditions       :text
#  surveillance     :text
#


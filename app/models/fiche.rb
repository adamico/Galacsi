#encoding: utf-8
class Fiche < ActiveRecord::Base
  attr_accessible :distinction, :distinction_type, :decision_id, :commentaire
  belongs_to :decision
  belongs_to :dci
  has_many :relationships
  has_many :relations, :through => :relationships

  DISTINCTIONS = %w[Indication Voie Dosage]

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
#


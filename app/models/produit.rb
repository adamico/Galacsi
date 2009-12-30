# == Schema Information
#
# Table name: produits
#
#  id              :integer         not null, primary key
#  name            :string(255)
#  created_at      :datetime
#  updated_at      :datetime
#  state           :string(255)
#  decision_id     :integer
#  validation_date :date
#  commentaire     :text
#

class Produit < ActiveRecord::Base

  attr_accessible :name, :decision_id, :commentaire
  belongs_to :decision
  has_many :relationships
  has_many :relations, :through => :relationships
  
  validates_presence_of :name
  validates_uniqueness_of :name

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


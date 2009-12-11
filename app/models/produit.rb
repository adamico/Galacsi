class Produit < ActiveRecord::Base
  # pretty urls prefixed by id-
  def to_param 
    require 'unicode'
    "#{id}" + Unicode::normalize_KD("-"+name+"-").downcase.gsub(/[^a-z0-9\s_-]+/,'').gsub(/[\s_-]+/,'-')[0..-2] 
  end

  attr_accessible :name, :decision_id, :commentaire
  belongs_to :decision
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

class Produit < ActiveRecord::Base
  validates_presence_of :name
  validates_uniqueness_of :name

  include AASM
  #TODO créer un attribute "date_de_validation" qui correspond à la date à laquelle les infos ont été révérifiées (avec ou sans modifications)

  attr_accessible :name

  # AASM stuff
  aasm_column :state
  aasm_initial_state :brouillon

  aasm_state :brouillon
  aasm_state :a_valider#, :enter => :some_stuf, :exit => :some_other_stuf
  aasm_state :valide, :enter => :set_validation_date
  aasm_state :gele, :enter => :blank_validation_date, :exit => :set_validation_date

  aasm_event :initialiser do
    transitions :to => :a_valider, :from => [:brouillon]
  end

  aasm_event :valider do
    transitions :to => :valide, :from => [:a_valider, :gele]
  end

  aasm_event :geler do
    transitions :to => :gele, :from => [:valide]
  end

  def set_validation_date; end

  def blank_validation_date; end
end

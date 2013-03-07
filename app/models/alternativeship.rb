class Alternativeship < ActiveRecord::Base
  attr_accessible :fiche_id, :alternative_id
  belongs_to :fiche
  belongs_to :alternative, class_name: 'Dci'
end

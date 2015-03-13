class Alternativeship < ActiveRecord::Base
  belongs_to :fiche
  belongs_to :alternative, class_name: 'Dci'
end

class Produit < ActiveRecord::Base
  attr_accessible :name

  #TODO créer un attribute "date_de_validation" qui correspond à la date à laquelle les infos ont été révérifiées (avec ou sans modifications)
  #TODO créer soit un lookup avec les type de validations, soit une association

  # 0 => brouillon, 1 => à_valider, 2 => validé, 3 => gelé)
  attr_accessible :validation
end

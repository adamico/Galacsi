class Demande < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  validates :demandeur, presence: true

  NATURES = [
    ["Nouvelle DCI", "DCI"],
    ["Nouvelle spécialité", "specialite"],
    ["Nouvelle classe", "classe therapeutique"],
    ["Nouvelle fiche", "fiche"]
  ]
end

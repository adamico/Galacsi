#encoding: utf-8
class Demande < ActiveRecord::Base
  validates :name, :presence => true, :uniqueness => true
  validates :demandeur, :presence => true

  NATURES = [
    ["Nouvelle DCI", "DCI"],
    ["Nouvelle spécialité", "specialite"],
    ["Nouvelle classe", "classe therapeutique"],
    ["Nouvelle fiche", "fiche"]
  ]
end




# == Schema Information
# Schema version: 20101021093522
#
# Table name: demandes
#
#  id         :integer         primary key
#  nature     :string(255)
#  name       :string(255)
#  created_at :timestamp
#  updated_at :timestamp
#  contexte   :text
#  demandeur  :string(255)
#


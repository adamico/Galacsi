#encoding: utf-8
class Demande < ActiveRecord::Base
  validates_presence_of :name, :demandeur
  validates_uniqueness_of :name
  NATURES = [
    ["Nouvelle DCI", "DCI"],
    ["Nouvelle spécialité", "SPECIALITE"],
    ["Nouvelle classe", "CLASSE+THERAPEUTIQUE"],
    ["Nouvelle fiche", "fiche"]]
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


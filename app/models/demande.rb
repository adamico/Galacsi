#encoding: utf-8
class Demande < ActiveRecord::Base
  include Humanizer
  attr_accessor :bypass_humanizer
  attr_accessible :humanizer_answer, :humanizer_question_id, :nature, :name, :contexte, :demandeur
  validates :name, :presence => true, :uniqueness => true
  validates :demandeur, :presence => true

  NATURES = [
    ["Nouvelle DCI", "DCI"],
    ["Nouvelle spécialité", "specialite"],
    ["Nouvelle classe", "classe therapeutique"],
    ["Nouvelle fiche", "fiche"]
  ]

  if Rails.env.production?
    require_human_on :create, :unless => :bypass_humanizer
  end
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


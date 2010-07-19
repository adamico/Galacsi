#encoding: utf-8
class Demande < ActiveRecord::Base
  validates_presence_of :name
  validates_uniqueness_of :name
  NATURES = [["Nouvelle DCI", "DCI"], ["Nouvelle spécialité", "SPECIALITE"], ["Nouvelle fiche", "fiche"]]
end


# == Schema Information
#
# Table name: demandes
#
#  id         :integer         not null, primary key
#  nature     :string(255)
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#


class Alternativeship < ActiveRecord::Base
  belongs_to :fiche
  belongs_to :alternative, :class_name => 'Dci'
end



# == Schema Information
# Schema version: 20101021093522
#
# Table name: alternativeships
#
#  id             :integer         primary key
#  fiche_id       :integer
#  alternative_id :integer
#  created_at     :timestamp
#  updated_at     :timestamp
#


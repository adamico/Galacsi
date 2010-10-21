# == Schema Information
# Schema version: 20101021093522
#
# Table name: compositions
#
#  id            :integer         primary key
#  dci_id        :integer
#  specialite_id :integer
#  created_at    :timestamp
#  updated_at    :timestamp
#

class Composition < ActiveRecord::Base
  belongs_to :dci
  belongs_to :specialite
end



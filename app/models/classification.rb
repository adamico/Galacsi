# == Schema Information
# Schema version: 20101021093522
#
# Table name: classifications
#
#  id                      :integer         primary key
#  dci_id                  :integer
#  classe_therapeutique_id :integer
#  created_at              :timestamp
#  updated_at              :timestamp
#

class Classification < ActiveRecord::Base
  belongs_to :dci, :counter_cache => true
  belongs_to :classe_therapeutique, :counter_cache => true
end






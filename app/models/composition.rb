class Composition < ActiveRecord::Base
  attr_accessible :dci_id, :specialite_id

  belongs_to :dci, counter_cache: true
  belongs_to :specialite, counter_cache: true
end

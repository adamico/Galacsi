class Classification < ActiveRecord::Base
  attr_accessible :dci_id, :classe_therapeutique_id
  belongs_to :dci, counter_cache: true
  belongs_to :classe_therapeutique, counter_cache: true
end

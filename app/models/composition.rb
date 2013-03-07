class Composition < ActiveRecord::Base
  attr_accessible :dci_id, :specialite_id
  belongs_to :dci
  belongs_to :specialite
end

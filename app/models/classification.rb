class Classification < ActiveRecord::Base
  belongs_to :dci
  belongs_to :classe_therapeutique
end





# == Schema Information
#
# Table name: classifications
#
#  id                      :integer         not null, primary key
#  dci_id                  :integer
#  classe_therapeutique_id :integer
#  created_at              :datetime
#  updated_at              :datetime
#


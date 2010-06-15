class Classification < ActiveRecord::Base
  belongs_to :dci, :counter_cache => true
  belongs_to :classe_therapeutique, :counter_cache => true
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


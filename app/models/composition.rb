class Composition < ActiveRecord::Base
  belongs_to :dci
  belongs_to :specialite
end


# == Schema Information
#
# Table name: compositions
#
#  id            :integer         not null, primary key
#  dci_id        :integer
#  specialite_id :integer
#  created_at    :datetime
#  updated_at    :datetime
#


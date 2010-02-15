class Relationship < ActiveRecord::Base
  belongs_to :dci
  belongs_to :relation, :class_name => 'Dci'
end



# == Schema Information
#
# Table name: relationships
#
#  id          :integer         not null, primary key
#  dci_id      :integer
#  relation_id :integer
#  created_at  :datetime
#  updated_at  :datetime
#


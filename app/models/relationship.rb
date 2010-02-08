class Relationship < ActiveRecord::Base
  belongs_to :fiche
  belongs_to :relation, :class_name => 'Fiche'
end


# == Schema Information
#
# Table name: relationships
#
#  id          :integer         not null, primary key
#  fiche_id    :integer
#  relation_id :integer
#  created_at  :datetime
#  updated_at  :datetime
#


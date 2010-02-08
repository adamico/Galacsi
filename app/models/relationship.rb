class Relationship < ActiveRecord::Base
  belongs_to :produit
  belongs_to :relation, :class_name => 'Produit'
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


class Alternativeship < ActiveRecord::Base
  belongs_to :fiche
  belongs_to :alternative, :class_name => 'Dci'
end

# == Schema Information
#
# Table name: alternativeships
#
#  id             :integer         not null, primary key
#  fiche_id       :integer
#  alternative_id :integer
#  created_at     :datetime
#  updated_at     :datetime
#


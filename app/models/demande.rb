class Demande < ActiveRecord::Base
  validates :name, :presence => true, :uniqueness => true
end


# == Schema Information
#
# Table name: demandes
#
#  id         :integer         not null, primary key
#  nature     :string(255)
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#


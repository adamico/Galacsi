class Demande < ActiveRecord::Base
  attr_accessible :type, :name
end

# == Schema Information
#
# Table name: demandes
#
#  id         :integer         not null, primary key
#  type       :string(255)
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#


class Specialite < ActiveRecord::Base
  attr_accessible :name
end

# == Schema Information
#
# Table name: specialites
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

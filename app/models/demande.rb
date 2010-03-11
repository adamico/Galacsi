#encoding: utf-8
class Demande < ActiveRecord::Base
  validates_presence_of :name
  validates_uniqueness_of :name
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


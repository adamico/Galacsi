# == Schema Information
# Schema version: 20100924140658
#
# Table name: pages
#
#  id         :integer         not null, primary key
#  permalink  :string(255)
#  content    :text
#  created_at :datetime
#  updated_at :datetime
#

class Page < ActiveRecord::Base
end

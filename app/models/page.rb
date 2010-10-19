# == Schema Information
# Schema version: 20100924142056
#
# Table name: pages
#
#  id         :integer         not null, primary key
#  permalink  :string(255)
#  content    :text
#  created_at :datetime
#  updated_at :datetime
#  title      :string(255)
#

class Page < ActiveRecord::Base
  def title_or_permalink
    title.nil? ? permalink : title
  end
end

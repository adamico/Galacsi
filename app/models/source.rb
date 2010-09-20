class Source < ActiveRecord::Base
  has_and_belongs_to_many :fiches, :join_table => "fiches_sources"
  validates :name, :presence => true
  url_regex = /(^$)|(^(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(([0-9]{1,5})?\/.*)?$)/ix
  validates :url, :format => { :with => url_regex }
end



# == Schema Information
#
# Table name: sources
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  nature     :string(255)
#  url        :string(255)
#  created_at :datetime
#  updated_at :datetime
#


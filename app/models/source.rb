class Source < ActiveRecord::Base
  has_and_belongs_to_many :fiches, :join_table => "fiches_sources"
  validates_presence_of :name
  URL_REGEX = /(^$)|(^(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(([0-9]{1,5})?\/.*)?$)/ix
  validates_format_of :url, :with => URL_REGEX
end

# == Schema Information
#
# Table name: sources
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  type       :string(255)
#  url        :string(255)
#  created_at :datetime
#  updated_at :datetime
#


class Source < ActiveRecord::Base
  has_many :fiches, :through => :sourcings
  has_many :sourcings, :dependent => :destroy

  validates :name, :presence => true

  #url_regex = /(^$)|(^(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(([0-9]{1,5})?\/.*)?$)/ix
  #validates :url, :format => { :with => url_regex }
end




# == Schema Information
# Schema version: 20101021093522
#
# Table name: sources
#
#  id         :integer         primary key
#  name       :string(255)
#  nature     :string(255)
#  url        :string(255)
#  created_at :timestamp
#  updated_at :timestamp
#


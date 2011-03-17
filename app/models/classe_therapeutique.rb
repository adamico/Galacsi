class ClasseTherapeutique < ActiveRecord::Base
  require 'active_support'
  validates_presence_of :name
  validates_uniqueness_of :name

  has_many :classifications, :dependent => :destroy
  has_many :dcis, :through => :classifications

  before_validation :set_unicode_stripped_name

  default_scope order("name ASC")

  def set_unicode_stripped_name
    self.stripped_name ||= strip_unicode(self.name) if self.name
  end

  def strip_unicode(string)
    mb_string = ActiveSupport::Multibyte::Chars.new(string)
    mb_string.normalize(:kd).gsub(/[^\x00-\x7F]/,'').to_s
  end
end




# == Schema Information
# Schema version: 20101021093522
#
# Table name: classe_therapeutiques
#
#  id                    :integer         primary key
#  name                  :string(255)
#  created_at            :timestamp
#  updated_at            :timestamp
#  stripped_name         :string(255)
#  classifications_count :integer         default(0)
#


class Specialite < ActiveRecord::Base
  has_many :compositions, :dependent => :destroy
  has_many :dcis, :through => :compositions
  before_validation :set_unicode_stripped_name
  private

  def set_unicode_stripped_name
    self.stripped_name ||= strip_unicode(self.name.downcase) if self.name
  end

  def strip_unicode(string)
    mb_string = ActiveSupport::Multibyte::Chars.new string
    mb_string.normalize(:kd).gsub(/[^\x00-\x7F]/,'').to_s
  end
end



# == Schema Information
# Schema version: 20101021093522
#
# Table name: specialites
#
#  id            :integer         primary key
#  name          :string(255)
#  created_at    :timestamp
#  updated_at    :timestamp
#  stripped_name :string(255)
#


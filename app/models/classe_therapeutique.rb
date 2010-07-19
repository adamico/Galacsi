class ClasseTherapeutique < ActiveRecord::Base
  require 'active_support'
  validates_presence_of :name
  validates_uniqueness_of :name

  has_many :classifications, :dependent => :destroy
  has_many :dcis, :through => :classifications

  before_validation :set_unicode_stripped_name

  def set_unicode_stripped_name
    self.stripped_name ||= strip_unicode(self.name) if self.name
  end

  def strip_unicode(string)
    mb_string = ActiveSupport::Multibyte::Chars.new(string)
    mb_string.normalize(:kd).gsub(/[^\x00-\x7F]/,'').to_s
  end
end



# == Schema Information
#
# Table name: classe_therapeutiques
#
#  id                    :integer         not null, primary key
#  name                  :string(255)
#  created_at            :datetime
#  updated_at            :datetime
#  stripped_name         :string(255)
#  classifications_count :integer         default(0)
#


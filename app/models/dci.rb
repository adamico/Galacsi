#encoding: utf-8
class Dci < ActiveRecord::Base
  require 'unicode_utils/nfkd'
  validates_presence_of :name
  validates_uniqueness_of :name

  # use the "name" column as the basis of the friendly_id, and use slugs
  has_friendly_id :name, :use_slug => true,
    # remove accents and other diacritics from Western characters
    :approximate_ascii => true

  has_many :fiches, :dependent => :destroy

  has_many :classifications, :dependent => :destroy
  has_many :classe_therapeutiques, :through => :classifications

  has_many :compositions, :dependent => :destroy
  has_many :specialites, :through => :compositions

  attr_writer :commercial_names
  after_save :assign_commercial_names

  def commercial_names
    @commercial_names || specialites.map(&:name).map(&:humanize).join(', ')
  end

  private

  def assign_commercial_names
    if @commercial_names
      self.specialites = @commercial_names.split(', ').map do |name|
        Specialite.find_or_create_by_name(name)
      end
    end
  end

end



# == Schema Information
#
# Table name: dcis
#
#  id            :integer         not null, primary key
#  name          :string(255)
#  created_at    :datetime
#  updated_at    :datetime
#  stripped_name :string(255)
#


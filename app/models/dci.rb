class Dci < ActiveRecord::Base
  validates_presence_of :name
  validates_uniqueness_of :name
  
  has_many :fiches, :dependent => :destroy
  has_many :compositions, :dependent => :destroy
  has_many :specialites, :through => :compositions

  attr_writer :commercial_names
  after_save :assign_commercial_names

  def commercial_names
    @commercial_names || specialites.map(&:name).join(', ')
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
#  id         :integer         not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#


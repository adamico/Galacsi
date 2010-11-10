class Sourcing < ActiveRecord::Base
  belongs_to :fiche
  belongs_to :source

  def source_name
    source.name if source
  end
  def source_name=(name)
    self.source = Source.find_or_create_by_name(name) unless name.blank?
  end
end

# == Schema Information
# Schema version: 20101021093522
#
# Table name: sourcings
#
#  id         :integer         primary key
#  fiche_id   :integer
#  source_id  :integer
#  created_at :timestamp
#  updated_at :timestamp
#


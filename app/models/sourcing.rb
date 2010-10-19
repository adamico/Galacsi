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

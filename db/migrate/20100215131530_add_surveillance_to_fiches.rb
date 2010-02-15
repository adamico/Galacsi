class AddSurveillanceToFiches < ActiveRecord::Migration
  def self.up
    add_column :fiches, :surveillance, :text
  end

  def self.down
    remove_column :fiches, :surveillance
  end
end

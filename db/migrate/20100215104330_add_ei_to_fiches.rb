class AddEiToFiches < ActiveRecord::Migration
  def self.up
    add_column :fiches, :ei, :text
  end

  def self.down
    remove_column :fiches, :ei
  end
end

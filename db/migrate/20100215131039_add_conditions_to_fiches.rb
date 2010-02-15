class AddConditionsToFiches < ActiveRecord::Migration
  def self.up
    add_column :fiches, :conditions, :text
  end

  def self.down
    remove_column :fiches, :conditions
  end
end

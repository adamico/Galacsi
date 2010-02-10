class AddDistinctionToFiches < ActiveRecord::Migration
  def self.up
    add_column :fiches, :distinction, :text
    add_column :fiches, :distinction_type, :text    
  end

  def self.down
    remove_column :fiches, :distinction
    remove_column :fiches, :distinction_type
  end
end

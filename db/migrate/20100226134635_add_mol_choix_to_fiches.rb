class AddMolChoixToFiches < ActiveRecord::Migration
  def self.up
    add_column :fiches, :de_choix, :boolean
  end

  def self.down
    remove_column :fiches, :de_choix
  end
end

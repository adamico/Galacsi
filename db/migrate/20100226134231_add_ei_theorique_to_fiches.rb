class AddEiTheoriqueToFiches < ActiveRecord::Migration
  def self.up
    add_column :fiches, :ei_theoriques, :text
  end

  def self.down
    remove_column :fiches, :ei_theoriques
  end
end

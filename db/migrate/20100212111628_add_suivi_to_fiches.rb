class AddSuiviToFiches < ActiveRecord::Migration
  def self.up
    add_column :fiches, :suivi, :string
  end

  def self.down
    remove_column :fiches, :suivi
  end
end

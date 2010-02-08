class RenameProduitsToFiches < ActiveRecord::Migration
  def self.up
    rename_table(:produits, :fiches)
  end

  def self.down
    rename_table(:fiches, :produits)
  end
end
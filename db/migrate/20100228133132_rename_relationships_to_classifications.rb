class RenameRelationshipsToClassifications < ActiveRecord::Migration
  def self.up
    rename_table(:relationships, :classifications)
  end

  def self.down
    rename_table(:classifications, :relationships)
  end
end

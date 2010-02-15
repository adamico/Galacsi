class RenameColumnsInRelationships < ActiveRecord::Migration
  def self.up
    change_table :relationships do |t|
      t.rename :fiche_id, :dci_id
    end
  end

  def self.down
    change_table :relationships do |t|
      t.rename :dci_id, :fiche_id
    end
  end
end

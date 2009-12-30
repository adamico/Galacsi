class AddIndexToProduit < ActiveRecord::Migration
  def self.up
    add_index :produits, :decision_id
  end

  def self.down
    remove_index :produits, :column => :decision_id
  end
end

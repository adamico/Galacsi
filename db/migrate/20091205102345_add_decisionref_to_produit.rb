class AddDecisionrefToProduit < ActiveRecord::Migration
  def self.up
    add_column :produits, :decision_id, :integer
  end

  def self.down
    remove_column :produits, :decision_id
  end
end

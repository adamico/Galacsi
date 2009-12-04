class AddStateToProduit < ActiveRecord::Migration
  def self.up
    add_column :produits, :state, :string
  end

  def self.down
    remove_column :produits, :state
  end
end

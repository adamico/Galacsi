class AddValidationToProduits < ActiveRecord::Migration
  def self.up
    change_table :produits do |t|
      t.integer :validation, :default => '0'
    end
  end

  def self.down
    change_table :produits do |t|
      t.remove :validation
    end
  end
end

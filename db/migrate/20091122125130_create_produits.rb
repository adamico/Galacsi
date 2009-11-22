class CreateProduits < ActiveRecord::Migration
  def self.up
    create_table :produits do |t|
      t.string :name
      t.timestamps
    end
  end
  
  def self.down
    drop_table :produits
  end
end

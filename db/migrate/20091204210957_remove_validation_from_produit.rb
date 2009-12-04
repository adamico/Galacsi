class RemoveValidationFromProduit < ActiveRecord::Migration
  def self.up
    change_table :produits do |t|
      t.remove :validation
    end
  end

  def self.down
   raise ActiveRecord::IrreversibleMigration
  end
end

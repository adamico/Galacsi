class AddValidationDateToProduit < ActiveRecord::Migration
  def self.up
    add_column :produits, :validation_date, :date
  end

  def self.down
    remove_column :produits, :validation_date
  end
end

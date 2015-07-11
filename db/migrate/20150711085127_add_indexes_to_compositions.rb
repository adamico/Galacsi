class AddIndexesToCompositions < ActiveRecord::Migration
  def change
    add_index :compositions, [:dci_id, :specialite_id], unique: true
  end
end

class AddIndexesToClassifications < ActiveRecord::Migration
  def change
    add_index :classifications, [:dci_id, :classe_therapeutique_id], unique: true
  end
end

class AddIndexesToAlternativeships < ActiveRecord::Migration
  def change
    add_index :alternativeships, [:fiche_id, :alternative_id], unique: true
  end
end

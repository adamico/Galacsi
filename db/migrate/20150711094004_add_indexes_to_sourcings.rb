class AddIndexesToSourcings < ActiveRecord::Migration
  def change
    add_index :sourcings, [:fiche_id, :source_id], unique: true
  end
end

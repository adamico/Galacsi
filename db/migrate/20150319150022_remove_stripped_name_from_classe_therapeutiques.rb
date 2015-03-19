class RemoveStrippedNameFromClasseTherapeutiques < ActiveRecord::Migration
  def change
    remove_column :classe_therapeutiques, :stripped_name, :string
  end
end

class RemoveStrippedNameFromClasseTherapeutiques < ActiveRecord::Migration
  def up
    remove_column :classe_therapeutiques, :stripped_name
  end

  def down
    add_column :classe_therapeutiques, :stripped_name, :string
    add_index :classe_therapeutiques, :stripped_name
  end
end

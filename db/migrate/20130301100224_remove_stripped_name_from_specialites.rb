class RemoveStrippedNameFromSpecialites < ActiveRecord::Migration
  def up
    remove_column :specialites, :stripped_name
  end

  def down
    add_column :specialites, :stripped_name, :string
    add_index :specialites, :stripped_name
  end
end

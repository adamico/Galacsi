class RemoveStrippedNameFromDcis < ActiveRecord::Migration
  def up
    remove_column :dcis, :stripped_name
  end

  def down
    add_column :dcis, :stripped_name, :string
    add_index :dcis, :stripped_name
  end
end

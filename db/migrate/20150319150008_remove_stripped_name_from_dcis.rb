class RemoveStrippedNameFromDcis < ActiveRecord::Migration
  def change
    remove_column :dcis, :stripped_name, :string
  end
end

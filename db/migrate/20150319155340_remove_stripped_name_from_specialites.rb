class RemoveStrippedNameFromSpecialites < ActiveRecord::Migration
  def change
    remove_column :specialites, :stripped_name, :string
  end
end

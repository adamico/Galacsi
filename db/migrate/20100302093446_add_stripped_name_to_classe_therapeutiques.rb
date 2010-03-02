class AddStrippedNameToClasseTherapeutiques < ActiveRecord::Migration
  def self.up
    add_column :classe_therapeutiques, :stripped_name, :string
  end

  def self.down
    remove_column :classe_therapeutiques, :stripped_name
  end
end

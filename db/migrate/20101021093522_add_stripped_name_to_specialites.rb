class AddStrippedNameToSpecialites < ActiveRecord::Migration
  def self.up
    add_column :specialites, :stripped_name, :string
  end

  def self.down
    remove_column :specialites, :stripped_name
  end
end

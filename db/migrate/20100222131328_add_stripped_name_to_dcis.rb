class AddStrippedNameToDcis < ActiveRecord::Migration
  def self.up
    add_column :dcis, :stripped_name, :string
  end

  def self.down
    remove_column :dcis, :stripped_name
  end
end

class AddAbbrevToDecisions < ActiveRecord::Migration
  def self.up
    add_column :decisions, :abbr, :string
  end

  def self.down
    remove_column :decisions, :abbr
  end
end

class AddDciIdToFiches < ActiveRecord::Migration
  def self.up
    add_column :fiches, :dci_id, :integer
  end

  def self.down
    remove_column :fiches, :dci_id
  end
end

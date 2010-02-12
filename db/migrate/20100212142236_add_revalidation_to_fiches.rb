class AddRevalidationToFiches < ActiveRecord::Migration
  def self.up
    add_column :fiches, :revalider_le, :date
  end

  def self.down
    remove_column :fiches, :revalider_le
  end
end

class AddUserIdToFiches < ActiveRecord::Migration
  def self.up
    add_column :fiches, :user_id, :integer
  end

  def self.down
    remove_column :fiches, :user_id
  end
end

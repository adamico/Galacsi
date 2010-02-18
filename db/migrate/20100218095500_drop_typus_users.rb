class DropTypusUsers < ActiveRecord::Migration
  def self.up
    drop_table :typus_users
  end

  def self.down
    raise ActiveRecord::IrreversibleMigration
  end
end

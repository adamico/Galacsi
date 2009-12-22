class DeleteAssignmentsTable < ActiveRecord::Migration
  def self.up
    drop_table :assignments
  end

  def self.down
    raise ActiveRecord::IrreversibleMigration
  end
end

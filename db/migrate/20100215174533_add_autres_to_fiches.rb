class AddAutresToFiches < ActiveRecord::Migration
  def self.up
    add_column :fiches, :arg_autre, :text
  end

  def self.down
    remove_column :fiches, :arg_autre
  end
end

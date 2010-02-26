class AddPiclacteToFiches < ActiveRecord::Migration
  def self.up
    add_column :fiches, :pic_lacte, :string
  end

  def self.down
    remove_column :fiches, :pic_lacte
  end
end

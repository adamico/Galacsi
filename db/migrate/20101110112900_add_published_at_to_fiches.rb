class AddPublishedAtToFiches < ActiveRecord::Migration
  def self.up
    add_column :fiches, :published_at, :date
  end

  def self.down
    remove_column :fiches, :published_at
  end
end

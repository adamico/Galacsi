class AddIndexesToFiches < ActiveRecord::Migration
  def change
    add_index :fiches, :dci_id
    add_index :fiches, :distinction_id
    add_index :fiches, :user_id
    add_index :fiches, :revalider_le
    add_index :fiches, :published_at
    add_index :fiches, :state
  end
end

class RemovePermalinkFromPages < ActiveRecord::Migration
  def up
    remove_column :pages, :permalink
  end

  def down
    add_column :pages, :permalink, :string
  end
end

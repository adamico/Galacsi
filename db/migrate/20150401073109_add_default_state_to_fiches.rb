class AddDefaultStateToFiches < ActiveRecord::Migration
  def up
    change_table :fiches do |t|
      t.change_default(:state, 'brouillon')
    end
  end

  def down
    change_table :fiches do |t|
      t.change_default(:state, '')
    end
  end
end

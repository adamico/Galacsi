# encoding: utf-8
class CreateDecisions < ActiveRecord::Migration
  def self.up
    create_table :decisions do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end

  def self.down
    drop_table :decisions
  end
end

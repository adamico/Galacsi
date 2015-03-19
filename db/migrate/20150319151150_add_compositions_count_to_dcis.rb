class AddCompositionsCountToDcis < ActiveRecord::Migration
  def change
    add_column :dcis, :compositions_count, :integer, default: 0

    reversible do |dir|
      dir.up do
        Dci.reset_column_information
        Dci.find_each do |dci|
          Dci.update_counters dci.id, compositions_count: dci.compositions.length
        end
      end
    end
  end
end

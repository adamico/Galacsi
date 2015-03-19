class AddCompositionsCountToSpecialites < ActiveRecord::Migration
  def change
    add_column :specialites, :compositions_count, :integer

    reversible do |dir|
      dir.up do
        Specialite.reset_column_information
        Specialite.find_each do |specialite|
          Specialite.update_counters specialite.id,
            compositions_count: specialite.compositions.length
        end
      end
    end
  end
end

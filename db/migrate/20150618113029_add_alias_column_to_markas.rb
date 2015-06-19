class AddAliasColumnToMarkas < ActiveRecord::Migration
  def change
    add_column :markas, :name2, :string, index: true
  end
end

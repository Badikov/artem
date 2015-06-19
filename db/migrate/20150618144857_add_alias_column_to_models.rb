class AddAliasColumnToModels < ActiveRecord::Migration
  def change
    add_column :models, :name2, :string, index: true
  end
end

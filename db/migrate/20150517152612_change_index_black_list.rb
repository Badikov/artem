class ChangeIndexBlackList < ActiveRecord::Migration
  def change
    remove_index :black_lists, :phone

    add_index(:black_lists, :phone, unique: true)
  end
end

class CreateBlackLists < ActiveRecord::Migration
  def change
    create_table :black_lists do |t|
      t.string :phone, index: true, null: false
      t.string :coment

      t.timestamps null: false
    end
  end
end

class CreateOdometers < ActiveRecord::Migration
  def change
    create_table :odometers do |t|
      t.string :kilometer

      t.timestamps null: false
    end
  end
end

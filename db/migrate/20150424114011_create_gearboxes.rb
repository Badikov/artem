class CreateGearboxes < ActiveRecord::Migration
  def change
    create_table :gearboxes do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end

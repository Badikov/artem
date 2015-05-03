class CreateAds < ActiveRecord::Migration
  def change
    create_table :ads do |t|
      t.string :phone, index: true
      t.string :price
      t.string :location
      t.references :marka, index: true, foreign_key: true
      t.references :model, index: true, foreign_key: true
      t.references :release, index: true, foreign_key: true
      t.references :gearbox, index: true, foreign_key: true
      t.references :steer, index: true, foreign_key: true
      t.references :state, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

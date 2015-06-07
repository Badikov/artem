class CreateDroms < ActiveRecord::Migration
  def change
    create_table :droms do |t|
      t.string :phone, index: true, :null => false
      t.string :price, index: true, :default => 0, :null => false
      t.string :location, index: true
      t.string :md5
      t.boolean :obsolete, index: true, :default => false, :null => false

      t.references :region,index: true, foreign_key: true, null: false
      t.references :marka, index: true, foreign_key: true
      t.references :model, index: true, foreign_key: true
      t.references :release, index: true, foreign_key: true
      t.references :gearbox, index: true, foreign_key: true
      t.references :steer, index: true, foreign_key: true
      t.references :state, index: true, foreign_key: true

      t.timestamps null: false
    end
    add_index(:droms,[:created_at,:obsolete])
  end
end

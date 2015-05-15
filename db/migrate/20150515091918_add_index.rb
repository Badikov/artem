class AddIndex < ActiveRecord::Migration
  def change
    add_index :ads, :price

    add_index :ads, :location

    add_index(:ads,[:created_at,:obsolete])
  end
end

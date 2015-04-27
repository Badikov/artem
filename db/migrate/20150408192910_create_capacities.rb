class CreateCapacities < ActiveRecord::Migration
  def change
    create_table :capacities do |t|
      t.string :volume

      t.timestamps null: false
    end
  end
end

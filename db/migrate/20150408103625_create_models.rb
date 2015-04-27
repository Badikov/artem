class CreateModels < ActiveRecord::Migration
  def change
    create_table :models do |t|
      t.string :name

      t.references :marka, index: true
      t.timestamps null: false
    end
  end
end

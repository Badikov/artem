class CreateEngines < ActiveRecord::Migration
  def change
    create_table :engines do |t|
      t.string :typ

      t.timestamps null: false
    end
  end
end

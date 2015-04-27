class CreateSteers < ActiveRecord::Migration
  def change
    create_table :steers do |t|
      t.string :typ

      t.timestamps null: false
    end
  end
end

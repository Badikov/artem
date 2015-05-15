class ChangeColumnToAds < ActiveRecord::Migration
  def change
    change_column :ads, :price, :integer, :default => 0, :null => false
  end
end

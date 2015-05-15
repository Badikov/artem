class ChangeColumnObsoleteToAds < ActiveRecord::Migration
  def change
    change_column :ads, :obsolete, :boolean, :default => false, :null => false
  end
end

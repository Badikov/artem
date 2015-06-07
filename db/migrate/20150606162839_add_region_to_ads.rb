class AddRegionToAds < ActiveRecord::Migration
  def up
    add_column :ads, :region_id, :integer
    Ad.reset_column_information
    Ad.all.each { |a| a.update region_id: 1 }

    add_foreign_key :ads, :regions
  end

  def down
    remove_column :ads, :region_id
  end
end

class AddRegionToLocation < ActiveRecord::Migration
  def up
    add_column :locations, :region_id, :integer
  end

  def down
    remove_column :locations, :region_id, :integer
  end
end

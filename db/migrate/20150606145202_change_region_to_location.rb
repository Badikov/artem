class ChangeRegionToLocation < ActiveRecord::Migration
  def change
    Location.reset_column_information
    Location.all.each { |l| l.update region_id: 1 }

    change_column :locations, :region_id, :integer , index: true, foreign_key: true, :null => false
  end
end

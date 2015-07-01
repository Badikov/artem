class Location < ActiveRecord::Base
  belongs_to :region

  def self.get_location_name(loc_id)
  	Location.find_by_id(loc_id).select("name")
  end
end

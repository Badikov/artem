class LocationsController < ApplicationController
  respond_to :json,:html,:js

  # GET /locations
  # GET /locations.json
  def index
    @region = Region.find_by_id params[:region_id]
    @locations = @region.locations.select("id,name,region_id")

    respond_with @locations #Location.select("id,name")
  end

  def create
    @region = Region.find params[:region_id]
    @location = @region.locations.build location_params
    respond_to do |format|
      if @location.save
        format.js   {}
      else
        format.json { render json: @region.errors, status: :unprocessable_entity }
      end
    end
  end

  private
  def location_params
    params.require(:location).permit(:name,:region_id)
  end
end

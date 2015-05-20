class LocationsController < ApplicationController
  respond_to :json

  # GET /locations
  # GET /locations.json
  def index
    respond_with Location.select("id,name")
  end
end

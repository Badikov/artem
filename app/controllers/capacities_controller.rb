class CapacitiesController < ApplicationController
  def index
    @capacities = Capacity.select("id,volume")
    respond_to do |format|
      format.json {render json: @capacities}
    end
  end
end

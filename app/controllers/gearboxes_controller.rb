class GearboxesController < ApplicationController
  def index
    @gearboxes = Gearbox.select("id,name")
    respond_to do |format|
      format.json {render json: @gearboxes}
    end
  end
end

class OdometersController < ApplicationController
  def index
    @odometers = Odometer.select("id,kilometer")
    respond_to do |format|
      format.json {render json: @odometers}
    end
  end
end

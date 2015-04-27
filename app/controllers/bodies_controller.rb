class BodiesController < ApplicationController
  def index
    @bodies = Body.select("id,typ")
    respond_to do |format|
      format.json {render json: @bodies}
    end
  end
end

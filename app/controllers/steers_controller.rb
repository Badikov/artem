class SteersController < ApplicationController
  def index
    @steers = Steer.select("id,typ")
    respond_to do |format|
      format.json {render json: @steers}
    end
  end
end

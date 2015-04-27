class EnginesController < ApplicationController
  def index
    @engines = Engine.select("id,typ")
    respond_to do |format|
      format.json {render json: @engines}
    end
  end
end

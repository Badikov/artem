class StatesController < ApplicationController
  def index
    @states = State.select("id,name")
    respond_to do |format|
      format.json {render json: @states}
    end
  end
end

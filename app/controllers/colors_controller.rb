class ColorsController < ApplicationController
  def index
    @colors = Color.select("id,name")
    respond_to do |format|
      format.json {render json: @colors}
    end
  end
end

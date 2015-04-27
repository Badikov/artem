class DrivesController < ApplicationController
  def index
    @drives = Drive.select("id,name")
    respond_to do |format|
      format.json {render json: @drives}
    end
  end
end

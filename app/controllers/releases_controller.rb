class ReleasesController < ApplicationController
  def index
    @releases = Release.select("id,data")
    respond_to do |format|
      format.json {render json: @releases}
    end
  end
end

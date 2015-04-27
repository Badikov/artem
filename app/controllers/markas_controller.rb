class MarkasController < ApplicationController
  def index
    @markas = Marka.select("id,name")
    respond_to do |format|
      format.json {render json: @markas}
    end
  end
end

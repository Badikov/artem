class ModelsController < ApplicationController

  def index
    @models = Marka.find(params[:marka_id]).models.select("id,name")
    respond_to do |format|
      format.json {render json: @models}
    end
  end

  def show
    
  end
end

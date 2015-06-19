class ModelsController < ApplicationController
  before_action :set_model, only: [:show, :edit, :update, :destroy]
  def index
    @marka = Marka.find(params[:marka_id])
    @models = Marka.find(params[:marka_id]).models.select("id,name,name2")
    # Rails.logger.info(@models.inspect)
    respond_to do |format|
      format.json {render json: @models}
      format.html 
    end
  end
   def update
     @result = @model.update model_params
     # Rails.logger.info(@result.inspect)
     respond_to do |format|
      format.json {render json: status, :nothing => true}
      format.js {}
     end
   end

  def show
    
  end

  private
  def set_model
    @model = Model.find(params[:id])
  end
  def model_params
    params.require(:model).permit(:name, :name2)
  end
end

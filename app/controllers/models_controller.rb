class ModelsController < ApplicationController
  before_action :set_model, only: [:show, :edit, :update, :destroy]
  before_action :set_marka, only: [:index,:new,:create]
  def index
    @models = @marka.models.select("id,name,name2")
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
  def new
    @model = @marka.models.new
  end

  def create
    #@marka = Marka.find(params[:marka_id])
    @model = @marka.models.build model_params
    if @model.save
      redirect_to :action => "index" ,:marka_id => @model.marka_id
    end
  end

  def show
    
  end

  private
  def set_model
    @model = Model.find(params[:id])
  end
  def set_marka
    @marka = Marka.find(params[:marka_id])
  end
  def model_params
    params.require(:model).permit(:name, :name2)
  end
end

class AdsController < ApplicationController
  # 
  skip_before_filter :verify_authenticity_token,
                     :if => Proc.new { |c| c.request.format == 'application/json' }
  respond_to :json

  # GET /ads
  # GET /ads.json
  def index
    respond_with Ad.all 
  end
  def show
    respond_with Ad.find(params[:id])
  end

  def update
    respond_with Ad.update(params[:id], ad_params)
  end
  # POST /ads
  # POST /ads.json
  def create
    if !BlackList.if_phone_exist?(params[:ad][:phone])
      if Ad.create(ad_params) 
        render nothing: true, status: :created 
      else
        render nothing: true, status: :unprocessable_entity 
      end
    else
      #logger.debug{ "===============>" + params[:ad][:phone] }
      render nothing: true, status: :created
    end
  end

  def destroy
    respond_with Ad.destroy(params[:id])
  end
  # GET /search.json?param=value
  def search
    respond_with Ad.search params
    #logger.debug{ "===============>" + params[:model_id] }
  end

  private

  def ad_params
    params.require(:ad).permit(:phone, :price, :location, :marka_id, 
      :model_id, :release_id, :gearbox_id, :steer_id, :state_id)
  end
  
end

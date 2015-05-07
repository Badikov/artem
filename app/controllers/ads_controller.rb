class AdsController < ApplicationController
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
    Ad.create(ad_params) { render :nothing => true, status: :created }
  end

  def destroy
    respond_with Ad.destroy(params[:id])
  end

  private

  def ad_params
      params.require(:ad).permit(:phone, :price, :location, :marka_id, 
        :model_id, :release_id, :gearbox_id, :steer_id, :state_id)
    end
end

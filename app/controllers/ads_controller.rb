class AdsController < ApplicationController
  def index
    @ads = Ad.all
    respond_to do |format|
      format.json {render json: @ads}
    end
  end
  # POST /ads
  # POST /ads.json
  def create
    @ad = Ad.new(ad_params)
    respond_to do |format|
      if @ad.save
        format.html { redirect_to @ad, notice: 'Ad was successfully created.' }
        format.json { render action: 'show', status: :created, location: @ad }
      else
        format.html { render action: 'new' }
        format.json { render json: @ad.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def ad_params
      params.require(:ad).permit(:phone, :price, 
        :location, :marka_id, :model_id, :release_id, :gearbox_id, :steer_id, :state_id)
    end
end

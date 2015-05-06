class AdsController < ApplicationController
  respond_to :json

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
    respond_with Ad.create(ad_params)
    #@ad = Ad.new(ad_params)
=begin
    respond_to do |format|
      if @ad.save
        format.html { redirect_to @ad, notice: 'Ad was successfully created.' }
        format.json { render action: 'show', status: :created, location: @ad }
      else
        format.html { render action: 'new' }
        format.json { render json: @ad.errors, status: :unprocessable_entity }
      end
    end
=end
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

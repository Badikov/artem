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
    @ad = Ad.new(params[:ad])
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
end

class RegionsController < ApplicationController
  respond_to :json,:html,:js

  def index
    @regions = Region.select("id,name")
    @region = Region.new
    respond_with @regions
  end

  def create
    @region = Region.new region_params
    respond_to do |format|
      if @region.save
        format.html { redirect_to @region, notice: 'Region was successfully created.' }
        format.js   {}
        format.json { render json: @region, status: :created, location: @region }
      else
        format.html { render action: "new" }
        format.json { render json: @region.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @region = Region.find(params[:id])
    @region.destroy
    redirect_to regions_path, notice: "Region successfully deleted"
  end

  private

  def region_params
    params.require(:region).permit(:name)
  end
end

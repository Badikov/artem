class YesterdaysController < ApplicationController
  before_filter :require_user

  respond_to :html

  def index
  	
  end

  def yesterday
  	@phones = Ad.yesterday_ads params
  	render json: @phones
  end
end

class DromsController < ApplicationController
  skip_before_filter :verify_authenticity_token,
                     :if => Proc.new { |c| c.request.format == 'application/json' }
  respond_to :json

  # GET /droms
  # GET /droms.json
  def index
    respond_with Drom.all
  end

  # POST /droms
  # POST /droms.json
  def create
    if !BlackList.if_phone_exist?(params[:drom][:phone])
      if Drom.create(drom_params) 
        render nothing: true, status: :created 
      else
        render nothing: true, status: :unprocessable_entity 
      end
    else
      #logger.debug{ "===============>" + params[:drom][:phone] }
      render nothing: true, status: :created
    end
  end

  # GET /last_drom.json
  def last_d
    respond_with Drom.rows_last_10_min
  end

  private

  def drom_params
    params.require(:drom).permit(:phone, :price, :location, :marka_id, 
      :model_id, :release_id, :gearbox_id, :steer_id, :state_id, :region_id)
  end

end

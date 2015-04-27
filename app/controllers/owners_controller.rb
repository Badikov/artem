class OwnersController < ApplicationController
  def index
    @owners = Owner.select("id,name")
    respond_to do |format|
      format.json {render json: @owners}
    end
  end
end

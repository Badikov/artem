class RegionsController < ApplicationController
  respond_to :json

  def index
    respond_with Region.select("id,name")
  end
end

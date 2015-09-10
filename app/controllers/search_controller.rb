class SearchController < ApplicationController
  # before_filter :require_user
  respond_to :json

  # GET /search.json?param=value
  def search
    respond_with Ad.search params
  end

  # GET /search_drom.json?param=value
  def search_drom
  	respond_with Drom.search params
  end
end

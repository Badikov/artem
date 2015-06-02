class SearchController < ApplicationController

  respond_to :json

  # GET /search.json?param=value
  def search
    respond_with Ad.search params
  end
end

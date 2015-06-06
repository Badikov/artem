class VersionsController < ApplicationController
  respond_to :json

  def index
    render :text => '{
      "success":true,
      "latestVersion":2,
      "appURI":"http://178.76.212.238/welcome/download_apk"
      }'
  end
end

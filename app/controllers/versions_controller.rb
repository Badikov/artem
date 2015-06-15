class VersionsController < ApplicationController
  respond_to :json

  def index
    version = ""
    f = File.join(Rails.root, 'public', 'version.txt')
    file = File.open(f)
      file.each do |line|
        version = line
      end
    file.close
    render :text => '{
      "success":true,
      "latestVersion":' + version +',
      "appURI":"http://178.76.212.238/welcome/download_apk"
      }'
  end
end

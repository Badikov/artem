class WelcomeController < ApplicationController

  def index

  end

  def download_apk
    send_file(
      "/home/master/artem/shared/public/system/app-release.apk",
      #"#{Rails.root}/public/app-release.apk", 
      :type => 'application/vnd.android.package-archive', 
      :disposition => "attachment"
    )
=begin
    send_file(
      "#{Rails.root}/public/your_file.pdf",
      filename: "your_custom_file_name.pdf",
      type: "application/pdf"
    )
=end
  end
end

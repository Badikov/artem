class WhatsappController < ApplicationController

  def index
  	@markas = Marka.all.as_json(only: [:id, :name])
  	@gearboxes = Gearbox.all.as_json(only: [:id, :name])
  	@steers = Steer.all.as_json(only: [:id, :typ])
  	@states = State.all.as_json(only: [:id, :name])
    @data_hash = read_file_with_filters
  end

  def create
    
    data_hash = read_file_with_filters
    
    @new_filter = {}
    timestamp = Time.now.to_i
    @new_filter[timestamp] = params.as_json(except: [:utf8,:authenticity_token,:controller,:action])
    
    data_hash.merge!(@new_filter)
    file = File.open('filters.json','w+')
    file.puts(data_hash.to_json)
    file.close
  	# Rails.logger.info(params.as_json(except: [:utf8,:authenticity_token,:controller,:action]).inspect)
    
    # file = File.open('filters.json','r')
    # if file.size > 0
    #   puts file.size
    # else
    #   file.close
    #   file = File.new('filters.json','w+')
    #   ary << params.as_json(except: [:utf8,:authenticity_token,:controller,:action])
    #   file.write(ary)
    # end

  end

  def destroy
  	
  end

  private
  # directory = "../../shared"
  # f = File.join(Rails.root, 'public', 'version.txt')

  def read_file_with_filters
    require 'json'
    file = File.open('filters.json','r')
    st = file.read
    # puts st.to_s
    data_hash = if st.blank? 
                  {}
                else
                  JSON.parse(st)
                end
    file.close
    return data_hash
  end
end

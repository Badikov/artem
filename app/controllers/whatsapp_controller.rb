class WhatsappController < ApplicationController
  before_filter :require_user #, :only => [:new_phone, :send_phone]
  $foo = ''

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
    write_file_with_filters data_hash
  	# Rails.logger.info(params.as_json(except: [:utf8,:authenticity_token,:controller,:action]).inspect)
  end

  def update
    Rails.logger.info(params.inspect)
    @id = params[:id]
    data_hash = read_file_with_filters
    data_hash[@id].merge!({"human"=>params[:human]})
    write_file_with_filters data_hash

    render nothing: true
  end

  def destroy
    @id = params[:id]
    data_hash = read_file_with_filters
    data_hash.delete(@id)
    write_file_with_filters data_hash
  	# Rails.logger.info(params.inspect)
  end

  def new_phone
    # puts $foo
  end

  def send_phone
    require 'open3'
    password = ''
    @result  = ''
    @fail_result = []
    prx ="http://localhost:8118"

    if params[:phone].length == 11
      $foo = params[:phone]
      
      command = "export http_proxy=#{prx} && ~/yowsup/yowsup-cli registration -r sms -C 7 -p " + $foo
      Open3.popen2e(command) {|stdin, stdout_err, wait_thr|
        while line = stdout_err.gets
            @fail_result << line
          if line.start_with?("status:")
            @result = line.gsub("status: ", '').chop # sent || fail
          end
        end
      }
      # Rails.logger.info(params.inspect)
      # @result = "sent"
    elsif params[:phone].length == 6
      cmd = "export http_proxy=#{prx} && ~/yowsup/yowsup-cli registration -R #{params[:phone]} -C 7 -p " + $foo
      Open3.popen2e(cmd) {|stdin, stdout_err, wait_thr|
        while line = stdout_err.gets
          @fail_result << line
          if line.start_with?("status:")
            @result = line.gsub("status: ", '').chop # ok ||
          elsif line.start_with?("pw:")
            password = line.gsub("pw: ", '').chop  
          end
        end
      }

      unless password.blank?
        cmd = "ruby ~/whatsapp/add_phone_to_db.rb #{$foo} #{password}"
        Open3.popen2e(cmd) {|stdin, stdout_err, wait_thr|   }
      end
      # @result = "ok"
      # $foo = '' # не забыть в конце очистить номер телефона???????????????????????
    end
  end

  private
  # directory = "../../shared"
  # f = File.join(Rails.root, 'public', 'version.txt')

  def write_file_with_filters(hash)
    file = File.open('filters.json','w+')
    file.puts(hash.to_json)
    file.close
  end

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

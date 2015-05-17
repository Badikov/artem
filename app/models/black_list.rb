class BlackList < ActiveRecord::Base

  def self.if_phone_exist?(phone)
    return BlackList.exists?(phone: phone) 
  end
end

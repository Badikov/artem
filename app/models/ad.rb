class Ad < ActiveRecord::Base
  belongs_to :marka
  belongs_to :model
  belongs_to :release
  belongs_to :gearbox
  belongs_to :steer
  belongs_to :state
  belongs_to :region

  def self.delete_all_rows
    delete_all
  end

  def self.mark_obsolete_to_true_running_method
    Ad.not_obsolete.where('created_at < ?',(Time.now - 600)).update_all(obsolete: true)
  end

  def self.rows_last_10_min
    Ad.not_obsolete.where('created_at > ?',(Time.now - 600))
  end

  def self.yesterday_ads(search)
    # select('phone,created_at')._yesterday
    select('id,phone')._yesterday._overseas(search).
    _release_from(search)._release_to(search).
    _price_from(search)._price_to(search)._region(search).
    _location(search)
  end

  def self.search(search)
    select('id,phone,md5').not_obsolete._marka(search)._model(search).
    _gearbox(search)._steer(search)._state(search).
    _release_from(search)._release_to(search).
    _price_from(search)._price_to(search)._region(search).
    _location(search)._overseas(search)
    
    # logger.debug{"из модели " + search[:model_id]}
  end

    # not_obsolete - все только актуальные
  scope :not_obsolete, -> {where("obsolete = ?", false)}
  scope :_yesterday,   -> {where("DATE(created_at) = ?",Date.today-1)}
  scope :_marka,   ->(search) {where(marka_id:search[:marka_id]) if search[:marka_id].present?}
  scope :_model,   ->(search) {where(model_id:search[:model_id]) if search[:model_id].present?}
  scope :_gearbox, ->(search) {where(gearbox_id:search[:gearbox_id]) if search[:gearbox_id].present?}
  scope :_steer,   ->(search) {where(steer_id:search[:steer_id]) if search[:steer_id].present?}   
  scope :_state,   ->(search) {where(state_id:search[:state_id]) if search[:state_id].present?}
  # release_from & release_to
  scope :_release_to, ->(search) {where("release_id <= ?",search[:release_to]) if search[:release_to].present?}
  scope :_release_from, ->(search) {where("release_id >= ?",search[:release_from]) if search[:release_from].present?}
  # price_from & price_to
  scope :_price_to, ->(search) {where("price <= ?",search[:price_to]) if search[:price_to].present?}
  scope :_price_from, ->(search) {where("price >= ?",search[:price_from]) if search[:price_from].present?}
  
  scope :_region,   ->(search) {where(region_id:search[:region_id]) if search[:region_id].present?}
  # location=1
  scope :_location, ->(search) {where(location: get_location_name(search[:location])) if search[:location].present?}
=begin
  # location TODO - переделать нахрен
  scope :_location, ->(search) {  if search[:location].present? 
                                    if search[:location] == '1'
                                      where(location:"Краснодар")
                                    elsif search[:location] == '3'
                                      where(location:"Новороссийск")
                                    elsif search[:location] == '4'
                                      where(location:"Сочи")
                                    elsif search[:location] == '5'
                                      where(location:"Анапа")
                                    else
                                      #where("location <> ?","Краснодар")
                                      citys = ["Краснодар","Новороссийск","Сочи","Анапа"]
                                      where.not(location: citys)
                                    end
                                  end }
=end

  # overseas - только иномарки "overseas"=>"1"
  scope :_overseas, ->(search) {  if search[:overseas].present? 
                                    # id русских моделей авто
                                    ids = [125,126,127,128,129,130,131,132,133]
                                    where.not(marka_id: ids)

                                  end}

  before_create :add_md5

  protected

  def self.get_location_name(loc_id)
    location = Location.find_by_id(loc_id)
    return location.name
  end

  def add_md5
    #logger.debug { "===============>" + self.created_at.to_s  }
    _row = self.id.to_s + self.phone + self.price.to_s + self.created_at.to_s
    self.md5 = md5_hash _row
  end

  def md5_hash(row)
    require 'digest/md5'
    return Digest::MD5.hexdigest(row)
  end
  
end

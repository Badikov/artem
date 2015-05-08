class Ad < ActiveRecord::Base
  belongs_to :marka
  belongs_to :model
  belongs_to :release
  belongs_to :gearbox
  belongs_to :steer
  belongs_to :state

  def self.search(search)
    select('id,phone')._marka(search)._model(search).
    _gearbox(search)._steer(search)._state(search).
    _release_from(search)._release_to(search)
    
    # logger.debug{"из модели " + search[:model_id]}
  end

  scope :_marka,   ->(search) {where(marka_id:search[:marka_id]) if search[:marka_id].present?}
  scope :_model,   ->(search) {where(model_id:search[:model_id]) if search[:model_id].present?}
  scope :_gearbox, ->(search) {where(gearbox_id:search[:gearbox_id]) if search[:gearbox_id].present?}
  scope :_steer,   ->(search) {where(steer_id:search[:steer_id]) if search[:steer_id].present?}   
  scope :_state,   ->(search) {where(state_id:search[:state_id]) if search[:state_id].present?}
  # release_from & release_to
  scope :_release_to, ->(search) {where("release_id <= ?",search[:release_to]) if search[:release_to].present?}
  scope :_release_from, ->(search) {where("release_id >= ?",search[:release_from]) if search[:release_from].present?}

  
end

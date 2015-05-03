class Ad < ActiveRecord::Base
  belongs_to :marka
  belongs_to :model
  belongs_to :release
  belongs_to :gearbox
  belongs_to :steer
  belongs_to :state
end

class Region < ActiveRecord::Base
  has_many :locations, dependent: :destroy
  has_many :ads, dependent: :destroy
  has_many :droms, dependent: :destroy
end

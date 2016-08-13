class Port < ActiveRecord::Base
  validates :latitude, :longitude, presence: true

  has_many :cargoes
  has_many :raids
  has_many :ships, through: :raids

  reverse_geocoded_by :latitude, :longitude
  after_validation :reverse_geocode
end

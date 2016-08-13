class Raid < ActiveRecord::Base
  validates :date, :port_id, :ship_id, presence: true

  belongs_to :ship
  belongs_to :port

  scope :actual_volume, -> (cargo ) { where(ships: { hold_capacity: (cargo.volume * 0.9)..(cargo.volume * 1.1) }) }
  scope :actual_date, -> (cargo ) { where("date >= ?", cargo.date) }
end

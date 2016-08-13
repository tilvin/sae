class Cargo < ActiveRecord::Base
  belongs_to :port

  validates :port_id, :volume, :date, presence: true

  scope :actual_date, ->(r) {where('date <= ?', r.date)}
  scope :actual_volume, ->(r) { where(volume: (r.ship.hold_capacity * 0.9)..(r.ship.hold_capacity * 1.1)) }

  def near_port_ids
    Port.near([ self.port.latitude, self.port.longitude ], 5000).map(&:id)
  end

  def find_ship
    Raid.joins(:ship).actual_date(self).actual_date(self).where(port: self.near_port_ids).map do |raid|
      { id: raid.ship.id, ship_name: raid.ship.name, ship_hold_capacity: raid.ship.hold_capacity,
        raid_port: raid.port.name, raid_date: raid.date.strftime("%d.%m.%Y"),
        distance: self.port.distance_to([raid.port.latitude, raid.port.longitude]).round }
    end
  end
end

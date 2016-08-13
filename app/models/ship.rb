class Ship < ActiveRecord::Base
  has_many :raids
  has_many :ports, through: :raids

  def find_cargo
    raids.flat_map do |r|
      Port.near([ r.port.latitude, r.port.longitude ], 5000).flat_map do |port|
        cargoes = port.cargoes.actual_volume(r).actual_date(r)
        cargoes.flat_map do |cargo|
          { raid_port: r.port.name, cargo_port: cargo.port.name,
            distance_between_cargo_and_ship: cargo.port.distance_to([r.port.latitude, r.port.longitude]).round, cargo_name: cargo.name,
            raid_date: r.date.strftime("%d.%m.%Y"), cargo_date: cargo.date.strftime("%d.%m.%Y"), cargo_volume: cargo.volume }
        end
      end
    end
  end
end


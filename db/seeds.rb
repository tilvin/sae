# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# ['ship', rand(5_000..20_000),  rand(-60..60.0).round(6), rand([160..180, -180..-160.0].sample).round(6)]


portes = Port.create([{ name: 'Dingle Harbour', latitude: 52.13333333, longitude: -10.26666667 },
                      { name: 'Hirao', latitude: 33.9, longitude: 32.05 },
                      { name: 'Humbug Point Wharf', latitude: -12.66666667, longitude: 141.8666667 },
                      { name: 'Benghazi', latitude: 32.1166, longitude: 20.0833 },
                      { name: 'Seaham', latitude: 54.8333, longitude: -1.3166 },
                      { name: 'Skamania County', latitude: 45.68333333 , longitude: -121.8833333 },
                      { name: 'Puerto de Calpe', latitude: 0.0, longitude: -0.3333333333 },
                      { name: 'Blue Beach Harbour', latitude: 48.78333333, longitude: -58.78333333 }])

ships = [ "The Flying Dutchman", "The Red sails", "The Black Pearl", "«Queen Anne`s Revenge»", "Santa Maria", "La Nina",
          "Pinta", "Hispaniola", "Victoria" ]

ships.each do |name, hold_capacity|
  Ship.create(name: name, hold_capacity: rand(3_000..5_000))
end

cargo_name = ['spice', 'slaves', 'gold', 'silk', 'horses', 'cofe', 'tobacco', 'immigrants', 'vine', 'grain']
cargoes =  10.times.map { [cargo_name.sample, rand(3_000..5_000), Port.all.sample, rand((Date.tomorrow)..(Date.tomorrow + 30.days))] }

cargoes.each do |name, volume, port, date|
  Cargo.create(name: name, volume: volume, port: port, date: date)
end

Ship.all.each do |ship|
  Port.all.each do |port|
    Raid.create(ship: ship, port: port, date: rand((Date.tomorrow)..(Date.tomorrow + 30.days) ))
  end
end

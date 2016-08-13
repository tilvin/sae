class Api::V1::ShipsController < ApplicationController

  def index
    ships = Ship.all
      render json: ships.map{ |ship|
        {
          name: ship.name,
          hold_capacity: ship.hold_capacity
        }
      }
  end

def show
  ship = Ship.find(params[:id])
    render json: {
      name: ship.name,
      hold_capacity: ship.hold_capacity,
      nearest_cargo: ship.find_cargo.sort_by { |cargo| [cargo[:distance_between_cargo_and_ship], cargo[:raid_date].to_date] }
    }
  end
end
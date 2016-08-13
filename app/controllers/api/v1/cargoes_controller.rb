class Api::V1::CargoesController < ApplicationController

  def index
    cargoes = Cargo.all
    render json: cargoes.map { |cargo|
      {
        name: cargo.name,
        port: cargo.port.name,
        volume: cargo.volume,
        date: cargo.date
      }
    }
  end

  def show
    cargo = Cargo.find(params[:id])

    render json: {
      name: cargo.name,
      port: cargo.port.name,
      open_date: cargo.date.strftime("%d.%m.%Y"),
      volume: cargo.volume,
      address: cargo.port.address,
      nearest_ships: cargo.find_ship.sort_by { |raid| [raid[:distance], raid[:raid_date].to_date ] }
    }
  end
end
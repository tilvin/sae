require "rails_helper"

RSpec.describe Raid, :type => :model do
  before (:each) do
    @port = create(:port)
    @cargo = create(:cargo, name: "cargo", port: @port, volume: 1000, date: 10.days.since)
  end

  describe ".find_ship" do
    it 'find right ship' do
      ship = create(:ship)
      create(:raid, port: @port, ship: ship, date: @cargo.date)
      expect(@cargo.find_ship.first[:ship_name]).to eq(ship.name)
    end

    it 'find no ship because of unsuitable date' do
      ship = create(:ship)
      create(:raid, port: @port, ship: ship, date: (@cargo.date - 1.day))
      expect(ship.find_cargo).to eq []
    end

    it 'find no ship because of unsuitable hold_capacity' do
      ship = create(:ship, hold_capacity: @cargo.volume * 0.8)
      raid = create(:raid, port: @port, ship: ship, date: @cargo.date)
      expect(ship.find_cargo).to eq []
    end
  end
end

require "rails_helper"

RSpec.describe Cargo, :type => :model do
  before (:each) do
    @port = create(:port)
    @ship = create(:ship)
  end

  describe ".find_cargo" do
    it 'find right cargo' do
      cargo = create(:cargo, port: @port)
      create(:raid, port: @port, ship: @ship, date: cargo.date)
      expect(@ship.find_cargo.first[:cargo_name]).to eq(cargo.name)
    end

    it 'find no cargo because of unsuitable date' do
      cargo = create(:cargo, port: @port)
      create(:raid, port: @port, ship: @ship, date: (cargo.date - 1.day))
      expect(@ship.find_cargo).to eq []
    end

    it 'find no cargo because of unsuitable hold_capacity' do
      cargo = create(:cargo, name: "кофе", port: @port, date: 10.days.since, volume: (@ship.hold_capacity * 1.2))
      raid = create(:raid, port: @port, ship: @ship, date: cargo.date)
      expect(@ship.find_cargo).to eq []
    end
  end
end

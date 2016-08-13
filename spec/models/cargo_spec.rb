require "rails_helper"

RSpec.describe Cargo, :type => :model do

before (:each) do
    @port = create(:port)
    @port_2 = create(:port2)
    @port_3 = create(:port3)
    @cargo = create(:cargo, port: @port)
  end

  describe ".near_port_ids" do

    it '.return right ports ids' do
      expect(@cargo.near_port_ids).to eq([@port.id, @port_2.id])
    end

    it '.return wrong ports ids' do
      expect(@cargo.near_port_ids).not_to eq([@port.id, @port_3.id])
    end
  end
end
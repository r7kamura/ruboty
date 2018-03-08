require "spec_helper"

describe Ruboty::Routers::Base do
  before do
    allow_any_instance_of(Ruboty::Robot).to receive(:server).and_call_original
    allow_any_instance_of(Ruboty::Robot).to receive(:route).and_call_original
  end

  after do
    Ruboty.routers.pop
  end

  let(:robot) do
    Ruboty::Robot.new
  end

  let!(:router_class) do
    Class.new(described_class) do
      on("/hello", name: "hello")

      def hello(_, response)
        response.body = "world"
      end
    end
  end

  let(:response) do
    Net::HTTP.new("localhost", ENV["RUBOTY_PORT"]).get("/hello")
  end

  describe ".on" do
    before do
      robot.send(:route)
    end

    after do
      robot.server.shutdown
      while !robot.server.listeners.empty? do
        sleep 1
      end
    end

    it "registers a path to the router" do
      expect(response.code).to eq "200"
      expect(response.body).to eq "world"
    end
  end
end

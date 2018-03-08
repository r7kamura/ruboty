require "spec_helper"

describe Ruboty::Routers::Say do
  before do
    allow_any_instance_of(Ruboty::Robot).to receive(:server).and_call_original
    allow_any_instance_of(Ruboty::Robot).to receive(:route).and_call_original
    robot.send(:route)
  end

  after do
    robot.server.shutdown
    while !robot.server.listeners.empty? do
      sleep 1
    end
  end

  let(:robot) do
    Ruboty::Robot.new
  end

  describe "/say" do
    let(:from) do
      "alice"
    end

    let(:to) do
      "#general"
    end

    let(:body) do
      "hello"
    end

    let(:data) do
      "from=#{from}&to=#{to}&body=#{body}"
    end

    it "posts message by specified parameters" do
      expect(robot).to receive(:say).with(
        body: body,
        from: from,
        to: to,
      )
      Net::HTTP.new("localhost", ENV["RUBOTY_PORT"]).post("/say", data)
    end
  end
end

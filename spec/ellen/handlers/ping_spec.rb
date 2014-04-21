require "spec_helper"

describe Ellen::Handlers::Ping do
  let(:robot) do
    Ellen::Robot.new
  end

  describe "#ping" do
    {
      "@ellen ping" => "pong",
      "@ellen Ping" => "Pong",
      "@ellen PING" => "PONG",
    }.each do |input, output|
      it "responds to `#{input}` and says `#{output}`" do
        robot.should_receive(:say).with(output)
        robot.receive(body: input)
      end
    end
  end
end

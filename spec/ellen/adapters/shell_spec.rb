require "spec_helper"

describe Ellen::Adapters::Shell do
  before do
    Ellen.logger.stub(:info)

    adapter.stub(:exit) do
      adapter.stop
    end
  end

  let(:adapter) do
    described_class.new(robot)
  end

  let(:robot) do
    Ellen::Robot.new
  end

  describe "#run" do
    context "with `exit`" do
      it "stops" do
        Readline.stub(readline: "exit")
        adapter.should_receive(:stop).and_call_original
        adapter.run
      end
    end

    context "with `quit`" do
      it "stops" do
        Readline.stub(readline: "exit")
        adapter.should_receive(:stop).and_call_original
        adapter.run
      end
    end

    context "with Inturrupt from console" do
      it "stops" do
        Readline.stub(:readline).and_raise(Interrupt)
        adapter.should_receive(:stop).and_call_original
        adapter.run
      end
    end

    context "without `exit` nor `quit`" do
      it "passes given message to robot" do
        Readline.stub(:readline).and_return("a", "exit")
        robot.should_receive(:receive).with(body: "a", source: described_class::SOURCE)
        adapter.run
      end
    end
  end

  describe "#say" do
    it "shows given message body on stdout" do
      Ellen.logger.should_receive(:info).with("a")
      adapter.say("a")
    end
  end
end

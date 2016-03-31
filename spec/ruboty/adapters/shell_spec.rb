require "spec_helper"

describe Ruboty::Adapters::Shell do
  before do
    allow(Ruboty.logger).to receive(:info)
  end

  let(:adapter) do
    described_class.new(robot)
  end

  let(:robot) do
    Ruboty::Robot.new
  end

  describe "#run" do
    context "with `exit`" do
      it "stops" do
        allow(Readline).to receive(:readline).and_return("exit")
        expect(adapter).to receive(:stop).and_call_original
        adapter.run
      end
    end

    context "with `quit`" do
      it "stops" do
        allow(Readline).to receive(:readline).and_return("quit")
        expect(adapter).to receive(:stop).and_call_original
        adapter.run
      end
    end

    context "with EOF" do
      it "stops" do
        allow(Readline).to receive(:readline).and_return(nil)
        expect(adapter).to receive(:stop).and_call_original
        adapter.run
      end
    end

    context "with Inturrupt from console" do
      it "stops" do
        allow(Readline).to receive(:readline).and_raise(Interrupt)
        expect(adapter).to receive(:stop).and_call_original
        adapter.run
      end
    end

    context "without `exit` nor `quit`" do
      it "passes given message to robot" do
        allow(Readline).to receive(:readline).and_return("a", "exit")
        expect(robot).to receive(:receive).with(body: "a", source: described_class::SOURCE)
        adapter.run
      end
    end
  end
end

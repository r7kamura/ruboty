require "spec_helper"

describe Ellen::Commands::Run do
  describe "#call" do
    let(:command) do
      Ellen::CommandBuilder.new(arguments).build
    end

    let(:call) do
      command.call
    end

    let(:arguments) do
      []
    end

    it "calls Engine#run" do
      Ellen::Engine.any_instance.should_receive(:run).and_call_original
      call
    end
  end
end

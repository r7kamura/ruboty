require "spec_helper"

describe Ruboty::Commands::Run do
  describe "#call" do
    let(:command) do
      Ruboty::CommandBuilder.new(arguments).build
    end

    let(:call) do
      command.call
    end

    let(:arguments) do
      []
    end

    it "creates an adapter and calls .run to it" do
      Ruboty::Adapters::Shell.any_instance.should_receive(:run)
      call
    end
  end
end

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
      ["--adapter", adapter_name]
    end

    let(:adapter_name) do
      "shell"
    end

    context "with no adapter name" do
      before do
        arguments.clear
      end

      it "defaults to shell adapter" do
        Ellen::Adapters::Shell.any_instance.should_receive(:run)
        call
      end
    end

    context "with registered name" do
      it "runs the adapter" do
        Ellen::Adapters::Shell.any_instance.should_receive(:run)
        call
      end
    end

    context "with unregistered adapter name" do
      let(:adapter_name) do
        "unregistered"
      end

      it "exits with dying message" do
        Ellen.logger.should_receive(:error).with("Error: No adapter is defined for `unregistered`")
        expect { call }.to raise_error(SystemExit)
      end
    end
  end
end

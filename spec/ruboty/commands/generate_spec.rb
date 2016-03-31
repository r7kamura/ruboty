require "spec_helper"

describe Ruboty::Commands::Generate do
  describe "#call" do
    after do
      FileUtils.rmtree("./ruboty/")
    end

    let(:command) do
      Ruboty::CommandBuilder.new(arguments).build
    end

    let(:call) do
      command.call
    end

    let(:arguments) do
      ["--generate"]
    end

    context "with normal condition" do
      it "generates ./ruboty/ directory from our templates" do
        call
        expect(File).to be_exist("./ruboty/")
      end
    end

    context "when ./ruboty/ directory already exists" do
      before do
        FileUtils.mkdir("./ruboty/")
      end

      it "exits process with dying message" do
        expect(Ruboty.logger).to receive(:error).with("Error: ./ruboty/ already exists.")
        expect { call }.to raise_error(SystemExit)
      end
    end
  end
end

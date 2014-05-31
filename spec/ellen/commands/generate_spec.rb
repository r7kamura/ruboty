require "spec_helper"

describe Ruboty::Commands::Generate do
  describe "#call" do
    after do
      FileUtils.rmtree("./ellen/")
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
      it "generates ./ellen/ directory from our templates" do
        call
        File.exists?("./ellen/").should == true
      end
    end

    context "when ./ellen/ directory already exists" do
      before do
        FileUtils.mkdir("./ellen/")
      end

      it "exits process with dying message" do
        Ruboty.logger.should_receive(:error).with("Error: ./ellen/ already exists.")
        expect { call }.to raise_error(SystemExit)
      end
    end
  end
end

require "spec_helper"

describe Ellen::Commands::Generate do
  describe "#call" do
    after do
      FileUtils.rmtree("./ellen/")
    end

    let(:command) do
      Ellen::CommandBuilder.new(arguments).build
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
        Ellen.logger.should_receive(:error).with("./ellen/ already exists.")
        expect { call }.to raise_error(SystemExit)
      end
    end
  end
end

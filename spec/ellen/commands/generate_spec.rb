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
        $stdout = io
      end

      after do
        $stdout = STDOUT
      end

      let(:io) do
        StringIO.new
      end

      it "outputs warning message" do
        call
        io.string.should == "./ellen/ already exists.\n"
      end
    end
  end
end

require "spec_helper"

describe Ellen::Env::Validatable do
  let(:validatable_class) do
    Class.new do
      include Ellen::Env::Validatable

      env :A, "description of A"
      env :B, "description of B", optional: true
    end
  end

  let(:instance) do
    validatable_class.new
  end

  describe "#validate" do
    context "without required ENV" do
      it "raises Ellen::Env::ValidationError" do
        expect { instance.validate }.to raise_error(Ellen::Env::ValidationError)
      end
    end

    context "without optional ENV" do
      before do
        ENV["A"] = "dummy"
      end

      after do
        ENV["A"] = nil
      end

      it "does nothing" do
        expect { instance.validate }.not_to raise_error
      end
    end
  end

  describe "#validate!" do
    context "without required ENV" do
      it "dies with usage as erorr message" do
        Ellen.logger.should_receive(:error).with(/description of A/)
        Ellen.should_receive(:exit)
        instance.validate!
      end
    end
  end
end

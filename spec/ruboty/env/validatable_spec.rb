require "spec_helper"

describe Ruboty::Env::Validatable do
  let(:validatable_class) do
    Class.new do
      include Ruboty::Env::Validatable

      env :A, "description of A"
      env :B, "description of B", optional: true
    end
  end

  let(:instance) do
    validatable_class.new
  end

  describe "#validate" do
    context "without required ENV" do
      it "raises Ruboty::Env::ValidationError" do
        expect { instance.validate }.to raise_error(Ruboty::Env::ValidationError)
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
        Ruboty.logger.should_receive(:error).with(/description of A/)
        Ruboty.should_receive(:exit)
        instance.validate!
      end
    end
  end
end

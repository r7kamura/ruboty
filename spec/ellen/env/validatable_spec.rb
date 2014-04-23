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
    context "without require ENV" do
      it "raises Ellen::Env::ValidationError" do
        expect { instance.validate }.to raise_error(Ellen::Env::ValidationError)
      end
    end
  end
end

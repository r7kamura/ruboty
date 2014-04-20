require "spec_helper"

describe Ellen::Robot do
  let(:instance) do
    described_class.new(options)
  end

  let(:options) do
    {}
  end

  describe "#brain" do
    context "without any brain extension gem" do
      it "returns a Ellen::Brains::Base" do
        instance.brain.should be_a Ellen::Brains::Base
      end
    end
  end
end

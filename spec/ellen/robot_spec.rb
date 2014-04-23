require "spec_helper"

describe Ellen::Robot do
  let(:instance) do
    described_class.new(options)
  end

  let(:options) do
    {}
  end

  describe "#brain" do
    context "without any Brain class" do
      it "returns a Ellen::Brains::Memory" do
        instance.brain.should be_a Ellen::Brains::Memory
      end

      it "can be used as a Hash object" do
        instance.brain.data["a"] = 1
        instance.brain.data["a"].should == 1
      end
    end

    context "with another Brain class" do
      after do
        Ellen::Brains::Base.brain_classes.pop
      end

      let!(:another_brain_class) do
        Class.new(Ellen::Brains::Base)
      end

      it "returns its instance as a Brain" do
        instance.brain.should be_a another_brain_class
      end
    end
  end
end

require "spec_helper"

describe Ruboty::AdapterBuilder do
  let(:builder) do
    described_class.new(robot)
  end

  let(:robot) do
    Ruboty::Robot.new
  end

  describe "#build" do
    context "with no other adapter class definition" do
      it "returns a Ruboty::Adapters::Shell as a default adapter" do
        builder.build.should be_a Ruboty::Adapters::Shell
      end
    end

    context "with another adapter class definition" do
      after do
        Ruboty::AdapterBuilder.adapter_classes.pop
      end

      let!(:another_adapter_class) do
        Class.new(Ruboty::Adapters::Base) do
          def run
          end
        end
      end

      it "returns an instance of that adapter class" do
        builder.build.should be_a another_adapter_class
      end
    end
  end
end

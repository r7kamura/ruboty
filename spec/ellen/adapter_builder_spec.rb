require "spec_helper"

describe Ellen::AdapterBuilder do
  let(:builder) do
    described_class.new(robot, options)
  end

  let(:robot) do
    Ellen::Robot.new(options)
  end

  let(:options) do
    {}
  end

  describe "#build" do
    context "with no other adapter class definition" do
      it "returns a Ellen::Adapters::Shell as a default adapter" do
        builder.build.should be_a Ellen::Adapters::Shell
      end
    end

    context "with another adapter class definition" do
      after do
        Ellen::AdapterBuilder.adapter_classes.pop
      end

      let!(:another_adapter_class) do
        Class.new(Ellen::Adapters::Base) do
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

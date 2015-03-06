require "spec_helper"

describe Ruboty::Handlers::Help do
  let(:robot) do
    Ruboty::Robot.new
  end

  describe "#help" do
    let(:from) do
      "alice"
    end

    let(:to) do
      "#general"
    end

    context "with valid condition" do
      let(:body) do
        <<-EOS.strip_heredoc.strip
          ruboty /help( me)?(?: (?<filter>.+))?\\z/i - Show this help message
          ruboty /ping\\z/i - Return PONG to PING
          ruboty /who am i\\?/i - Answer who you are
        EOS
      end

      it "responds to `@ruboty help` and says each handler's description" do
        robot.should_receive(:say).with(
          body: body,
          code: true,
          from: to,
          to: from,
          original: {
            body: "@ruboty help",
            from: from,
            robot: robot,
            to: to,
          },
        )
        robot.receive(body: "@ruboty help", from: from, to: to)
      end
    end

    context "with filter" do
      it "filters descriptions by given filter" do
        robot.should_receive(:say).with(
          hash_including(
            body: "ruboty /ping\\z/i - Return PONG to PING",
          ),
        )
        robot.receive(body: "@ruboty help ping", from: from, to: to)
      end
    end
  end
end

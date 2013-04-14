require "spec_helper"

describe Mameconf do
  let(:included) {
    class Included
      include Mameconf
    end
  }

  describe "defualt value" do
    subject do
      included.class_eval do
        mameconf :host, default: "localhost"
      end
    end

    it "returns default valeu if not present" do
      included.new.host.shoud eq "localhost"
    end
  end
end

require "spec_helper"

describe Mameconf do
  class Included
    include Mameconf
  end

  describe "defualt value" do
    subject do
      Included.class_eval do
        mameconf :host, default: "localhost"
      end
      Included
    end

    it "returns default valeu if not present" do
      subject.new.host.should eq "localhost"
    end

    it "allows override default value" do
      instance = subject.new
      instance.host = "google.com"

      instance.host.should eq "google.com"
    end
  end
end

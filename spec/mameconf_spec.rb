require "spec_helper"

describe Mameconf do
  describe "defualt value" do
    subject do
      Class.new do
        include Mameconf
        mameconf :host, default: "localhost"
      end
    end

    it "returns default valeu if not present" do
      subject.new.host.should eq "localhost"
    end

    it "allows to override default value" do
      instance = subject.new
      instance.host = "google.com"

      instance.host.should eq "google.com"
    end
  end

  describe "#to_hash" do
    subject do
      Class.new do
        include Mameconf
        
        mameconf :host, default: "localhost"
        mameconf :port, default: 3337
      end.new
    end

    it "returns hash that included default values" do
      subject.to_hash.should eq ({ host: "localhost", port: 3337 })
    end
  end
end

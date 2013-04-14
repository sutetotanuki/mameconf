require "spec_helper"

describe Mameconf do
  describe "basic behavor" do
    subject do
      Class.new do
        include Mameconf
        mameconf :host, default: "localhost"
      end.new
    end

    it "returns default valeu if not present" do
      subject.host.should eq "localhost"
    end

    it "allows to override default value" do
      instance = subject
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
      end
    end

    it "returns hash that included default values" do
      subject.new.to_hash.should eq ({ host: "localhost", port: 3337 })
    end

    context "has no default value attribute" do
      before do
        subject.class_eval do
          mameconf :namespace
        end
      end

      it "has no dafalut value attribtue" do
        subject.new.namespace.should be_nil
      end

      it "has attributes that has default value" do
        subject.new.host.should eq "localhost"
      end
    end
  end
end

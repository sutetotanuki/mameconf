require "spec_helper"

describe Mameconf do
  describe "basic behavor" do
    subject do
      Class.new do
        include Mameconf
        mameconf :host, default: "localhost"
      end.new
    end

    it "returns default value if not present" do
      subject.host.should eq "localhost"
    end

    it "allows to override default value" do
      instance = subject
      instance.host = "google.com"

      instance.host.should eq "google.com"
    end

    it "allows to set nil value to attribute" do
      instance = subject
      instance.host = "google.com"
      instance.host = nil

      instance.host.should be_nil
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

  describe "#inheritance" do
    before do
      @parent = Class.new do
        include Mameconf

        mameconf :host, default: "localhost"
      end

      @sub = Class.new(@parent)
    end

    it "has mameconf attribute" do
      @sub.new.host.should eq "localhost"
    end

    context "add new attribute on Sub Class" do
      before do
        @sub.class_eval do
          mameconf :sub, default: "inu"
        end
      end
      
      it "has different memory space" do
        @sub.new.sub.should eq "inu"

        expect {
          @parent.new.sub
        }.to raise_error NoMethodError
      end
    end
  end
end

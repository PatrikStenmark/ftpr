require 'ftpr'
require 'ftpr/curl'
require 'ffi'

describe Ftpr::CurlEasy do
  describe "init" do
    it "should not raise any errors" do
      expect {
        handle = Ftpr::CurlEasy.init
      }.not_to raise_error
    end

    it "should return something" do
      handle = Ftpr::CurlEasy.init
      handle.should_not be_nil
    end
  end

  describe "setopt" do
    it "should not raise any errors" do
      handle = Ftpr::CurlEasy.init
      expect {
        handle = Ftpr::CurlEasy.setopt(handle, Ftpr::CurlEasy::Options::CURLOPT_URL, 'ftp://foobar.com/foo.txt')
      }.not_to raise_error
    end
  end

  describe "perform" do
    it "should not raise any errors" do
      handle = Ftpr::CurlEasy.init
      expect {
        handle = Ftpr::CurlEasy.perform(handle)
      }.not_to raise_error
    end
  end

  describe "cleanup" do
    it "should not raise any errors" do
      handle = Ftpr::CurlEasy.init
      expect {
        handle = Ftpr::CurlEasy.cleanup(handle)
      }.not_to raise_error
    end
  end

  describe "global_cleanup" do
    it "should not raise any errors" do
      expect {
        Ftpr::CurlEasy.global_cleanup
      }.not_to raise_error
    end
  end

end

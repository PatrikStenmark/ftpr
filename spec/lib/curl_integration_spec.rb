require 'fake_ftp'
require 'ftpr'
require 'ftpr/curl'

describe "ftpget.c in ruby" do
  before(:all) do

    @server = FakeFtp::Server.new(21212, 21213)
    @server.start

    @server.add_file("testfil.txt", "data")
  end

  
  it "works" do
    result = nil
    callback = FFI::Function.new(:int, [:pointer, :int, :int, :pointer]) do |buffer, size, nmemb, stream|
      puts "asdfasdfdsf"
      puts buffer.inspect
      result = buffer

    end
    
    global_init_result = Ftpr::CurlEasy.global_init(Ftpr::CurlEasy::Options::CURL_GLOBAL_ALL)
    puts global_init_result.inspect

    curl = Ftpr::CurlEasy.init

    puts curl.inspect

    Ftpr::CurlEasy.setopt(curl, Ftpr::CurlEasy::Options::CURLOPT_URL, 'ftp://localhost:21212/testfil.txt')
    Ftpr::CurlEasy.setopt(curl, Ftpr::CurlEasy::Options::CURLOPT_WRITEFUNCTION, callback)
    #Ftpr::CurlEasy.setopt(curl, Ftpr::CurlEasy::Options::CURLOPT_WRITEDATA, 'ftp://localhost:12312/testfil.txt')
    Ftpr::CurlEasy.setopt_long(curl, Ftpr::CurlEasy::Options::CURLOPT_VERBOSE, 1)

    res = Ftpr::CurlEasy.perform(curl)

    puts res.inspect

    Ftpr::CurlEasy.cleanup(curl)

    Ftpr::CurlEasy.global_cleanup()
    
    result.should_not be_nil

  end
end

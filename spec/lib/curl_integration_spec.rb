require 'fake_ftp'
require 'ftpr'
require 'ftpr/curl'

require 'ftpd'

describe "ftpget.c in ruby" do
  before(:all) do

    Dir.chdir("spec/fixtures")
    options = {
      host: '127.0.0.1',
      port: 12312,
      clients: 5,
      debug: true
    }
    thread = Thread.new do
      @server = FTPServer.new(options)
    end
    sleep 1
  end

  
  it "works" do
    result = nil
    callback = FFI::Function.new(:int, [:string, :int, :int, :pointer]) do |buffer, size, nmemb, stream|
      puts "asdfasdfdsf"
      puts "BUFFER IS #{buffer.inspect}"
      result = buffer
      buffer.length
    end
    
    global_init_result = Ftpr::CurlEasy.global_init(Ftpr::CurlEasy::Options::CURL_GLOBAL_ALL)
    puts global_init_result.inspect

    curl = Ftpr::CurlEasy.init

    puts curl.inspect

    Ftpr::CurlEasy.setopt(curl, Ftpr::CurlEasy::Options::CURLOPT_URL, 'ftp://localhost:12312/testfil.txt')
    Ftpr::CurlEasy.setopt(curl, Ftpr::CurlEasy::Options::CURLOPT_WRITEFUNCTION, callback)
    #Ftpr::CurlEasy.setopt(curl, Ftpr::CurlEasy::Options::CURLOPT_WRITEDATA, 'ftp://localhost:12312/testfil.txt')
    Ftpr::CurlEasy.setopt_long(curl, Ftpr::CurlEasy::Options::CURLOPT_VERBOSE, 1)

    res = Ftpr::CurlEasy.perform(curl)

    puts res.inspect

    Ftpr::CurlEasy.cleanup(curl)

    Ftpr::CurlEasy.global_cleanup()
    
    result.should_not be_nil
    result.should == "asdasd"

  end
end

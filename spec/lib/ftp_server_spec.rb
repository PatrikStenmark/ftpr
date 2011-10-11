require 'fake_ftp'
require 'ftpr'

describe "fetching a file" do
  before(:all) do
    @server = FakeFtp::Server.new(21212, 21213)
    @server.start

    @server.add_file("testfile.txt", "data")
  end

  after(:all) do
    @server.stop
  end

  it "fetches file from FTP server" do
    file = Ftpr::FTP.get_file_contents("ftp://localhost:21212/testfile.txt")
    file.should == "data"
  end

end


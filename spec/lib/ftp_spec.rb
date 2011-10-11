require 'fake_ftp'
require 'ftpr'

describe Ftpr::FTP do
  before(:all) do
    @server = FakeFtp::Server.new(21212, 21213)
    @server.start

    @server.add_file("testfile.txt", "data")
  end

  it "" do

  end
end

require "packetz"
require "./niji/*"

module Niji
  def self.color(byte)
    "\033[38;5;#{byte.to_s}m█\033[0;00m"
  end

  def self.run(interface = Packetz.interfaces.default, snaplen = 65535, promisc = 0, timeout_ms = 1)
    # create capture
    cap = Packetz.capture(interface, snaplen, promisc, timeout_ms)
    # stop the capture with ctl+C
    Signal::INT.trap do
      puts "\nStopping!\n"
      cap.stop!
      exit
    end
    # start capturing
    cap.start!
    # with each packet
    cap.each do |packet|
      # color packet bytes
      packet.each do |byte|
        print Niji.color(byte)
      end
      # don't get sick
      sleep 0.2 
    end
  end

end

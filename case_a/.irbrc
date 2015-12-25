# Count the bits in a file and returns the number of '0' and '1'
def count_bits path = nil
  if path.nil? || path == ""
    raise "No path given"
  else
    # Use relative and absolute path
    if File.exists?(path) || File.exists?("#{File.dirname(__FILE__)}/#{path}")
      # For this part I used this source: http://stackoverflow.com/questions/16821435/how-do-i-read-write-binary-files
      output = File.binread(path)
      bits = output.unpack("B*")[0]

      # Count the zeros and the ones
      zeros = bits.count("0")
      ones = bits.count("1")

      # Send a new-lined message to STDOUT and return the message a little shorter
      puts "Found #{ones} bits set to 1\nFound #{zeros} bits set to 0"
    	"Found #{ones} bits set to 1 & #{zeros} bits set to 0"
    else
      raise "Invalid path given"
    end
  end
end

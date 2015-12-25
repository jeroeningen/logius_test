require "minitest/spec"
require "minitest/autorun"

load "./.irbrc"

describe ".irbrc" do
	before(:each) do
		# Copy the images to your tmp-dir to test the absolute path
		system("cp test/test.jpg /tmp/")
		system("cp test/test.png /tmp/")
		system("cp test/test.gif /tmp/")
	end

	it "counts the bits in a file given an absolue path or a relative path" do
		# Relative paths
		assert_equal "Found 3395 bits set to 1 & 4405 bits set to 0", count_bits("test/test.jpg")
		assert_equal "Found 9109 bits set to 1 & 9603 bits set to 0", count_bits("test/test.png")
		assert_equal "Found 909 bits set to 1 & 1219 bits set to 0", count_bits("test/test.gif")

		# Absolue path
		assert_equal count_bits("test/test.jpg"), count_bits("/tmp/test.jpg")
		assert_equal count_bits("test/test.png"), count_bits("/tmp/test.png")
		assert_equal count_bits("test/test.gif"), count_bits("/tmp/test.gif")
	end

	it "raises an error if no path is given" do
		error = assert_raises RuntimeError do
			count_bits
		end
		assert_equal "No path given", error.message
		error = assert_raises RuntimeError do
			count_bits ""
		end
		assert_equal "No path given", error.message
	end

	it "raises an error if invalid path is given" do
		error = assert_raises RuntimeError do
			count_bits "/tmp/here_is_no_icon.png"
		end
		assert_equal "Invalid path given", error.message
	end
end

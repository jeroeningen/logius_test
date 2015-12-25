puts "Copying .irbrc file to your home directory..."

file_exists = File.exists?( File.expand_path "~/.irbrc" )
if file_exists
  puts "WARNING: Another .irbrc file already exists in your home directory!"
  puts "Do you want to overwrite the .irbrc file? (Y/N) +enter"
end

if !file_exists || STDIN.gets.chomp.upcase == "Y"
  system("cp .irbrc ~/")
  puts ".irbrc file successful copied."
else
  puts "ERROR: .irbrc file not copied."
end

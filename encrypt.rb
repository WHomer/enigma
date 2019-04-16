require './lib/enigma'
enigma = Enigma.new
file_name = ARGV[0]
message = File.read("./encrypted/#{file_name}").chomp
results = enigma.encrypt(message)
File.write("./encrypted/encrypted.txt", results[:encryption])
puts "Created \'encrypted.txt\' with the key #{results[:key]} and date #{results[:date]}"
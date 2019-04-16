require './lib/enigma'

enigma = Enigma.new
encrypted_file = ARGV[0]
decrypted_file = ARGV[1]
key = ARGV[2] 
date ||= ARGV[3]
message = File.read("./encrypted/#{encrypted_file}").chomp
results = enigma.decrypt(message, key, date)
File.write("./encrypted/#{decrypted_file}", results[:decryption])
puts "Created \'#{decrypted_file}\' with the key #{results[:key]} and date #{results[:date]}"

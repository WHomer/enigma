require './lib/enigma'
enigma = Enigma.new
file_name = ARGV[0]
message = File.read("./encrypted/#{file_name}").chomp
results = enigma.encrypt(message)
File.write("./encrypted/encrypted.txt", results[:encryption])
puts "Created \'encrypted.txt\' with the key #{results[:key]} and date #{results[:date]}"
# require 'pry'; binding.pry

# $ ruby ./lib/encrypt.rb message.txt encrypted.txt
# Created 'encrypted.txt' with the key 82648 and date 240818
# $ ruby ./lib/decrypt.rb encrypted.txt decrypted.txt 82648 240818
# Created 'decrypted.txt' with the key 82648 and date 240818
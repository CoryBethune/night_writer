require 'pry'
require './lib/dictionary'
require './lib/brailleable'

dictionary = Dictionary.new

message_txt = File.open(ARGV[0], 'r')
incoming_text = message_txt.read.chomp
message_txt.close

#need some kind of brail converter I think
binding.pry
test = dictionary.dict[incoming_text]

braille_txt = File.open(ARGV[1], 'w')
braille_txt.write(test)
braille_txt.close


puts "Created #{ARGV[1]} containing #{incoming_text.length} characters."

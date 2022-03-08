require 'pry'
require './lib/dictionary'

dictionary = Dictionary.new

message_txt = File.open(ARGV[0], 'r')
incoming_text = message_txt.read.chomp
message_txt.close

braille_text = dictionary.braille_output(incoming_text.downcase.split(""))

braille_txt = File.open(ARGV[1], 'w')
braille_txt.write(braille_text)
braille_txt.close


puts "Created #{ARGV[1]} containing #{incoming_text.length} characters."

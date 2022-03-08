require 'pry'
require './lib/dictionary'

dictionary = Dictionary.new

braille_txt = File.open(ARGV[0], 'r')
incoming_braille = braille_txt.read.chomp
braille_txt.close

# braille_text = dictionary.braille_output(incoming_text.downcase.split(""))
# binding.pry

original_txt = File.open(ARGV[1], 'w')
# binding.pry
original_txt.write(dictionary.english_output(incoming_braille))
original_txt.close


puts "Created #{ARGV[1]} containing #{incoming_braille.delete("\n").length} characters."

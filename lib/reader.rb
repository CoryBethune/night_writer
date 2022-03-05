require 'pry'

english_txt = File.open(ARGV[0], 'r')

incoming_text = english_txt.read

english_txt.close

puts incoming_text
#need some kind of brail converter I think

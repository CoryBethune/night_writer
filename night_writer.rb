require 'pry'

message_txt = File.open(ARGV[0], 'r')

incoming_text = message_txt.read

message_txt.close

#need some kind of brail converter I think

braille_txt = File.open(ARGV[1], 'w')
# binding.pry
braille_txt.write(incoming_text)

binding.pry
braille_txt.close


puts "Created #{ARGV[1]} containing #{incoming_text.length} characters."

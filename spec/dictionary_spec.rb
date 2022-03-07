require 'pry'
require './lib/dictionary'

RSpec.describe Dictionary do

  before(:each) do
    @dictionary = Dictionary.new
  end

  it 'exists' do
    expect(@dictionary).to be_a Dictionary
  end

  it 'has attributes' do
    expect(@dictionary.dict.class).to eq(Hash)
    expect(@dictionary.dict.length).to eq 36
    expect(@dictionary.dict.keys.first).to eq "a"
    expect(@dictionary.braille.values.first).to eq "a"
    expect(@dictionary.braille.length).to eq 36
    expect(@dictionary.braille.class).to eq(Hash)
  end

  it 'can read a string and convert it into an array of unformatted braille' do
    test = "a b c"
    expect(@dictionary.braille_array(test.split("")).class).to eq Array
    expect(@dictionary.braille_array(test.split("")).first).to eq ["0.", "..", ".."]
    expect(@dictionary.braille_array(test.split("")).length).to eq 5
  end

  it 'can format braille' do
    whatever = "abc"
    test = @dictionary.braille_array(whatever.split(""))
# binding.pry
    expect(@dictionary.format_braille(test)).to eq ("0.0.00..0.........")
  end

end

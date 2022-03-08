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

  it 'can format braille arrays to a string of braille' do
    whatever = "abc"
    test = @dictionary.braille_array(whatever.split(""))
    a = @dictionary.format_braille(test)
    expect(a).to eq ([["0.0.00"], ["..0..."], ["......"]])
  end

  xit "takes braille string and prints in the proper 3 line format with no more than 40 characters on a line" do

    expect()
  end

  #test below this line are for the braille to english methods

  it 'gets a string of braille and turns it into an array of individual chars' do
    whatever = "0.\n..\n.."
    expect(whatever.length).to eq 8
    expect(@dictionary.unstack_braille(whatever).length).to eq 6
    expect(@dictionary.unstack_braille(whatever).class).to be Array
    # binding.pry
  end

  it 'gets an array of individual character and creates a 2d array of arrays containing 3 elements of braille' do
    whatever = "0.\n..\n.."
    yay = @dictionary.unstack_braille(whatever)
    test = @dictionary.convert_to_braille_dict_format(yay)
    expect(test).to eq [["0.", "..", ".."]]
  end

  it "takes in a 2d array and returns corresponding values as a string" do
    test = @dictionary.english_output([["0.", "..", ".."]])
    expect(test).to eq "a"
  end
end

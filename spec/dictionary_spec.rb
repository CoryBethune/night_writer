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
    expect(@dictionary.dict.length).to eq 35
    expect(@dictionary.dict.keys.first).to eq "a"
    expect(@dictionary.braille.values.first).to eq "a"
    expect(@dictionary.braille.length).to eq 35
    expect(@dictionary.braille.class).to eq(Hash)
  end

  it 'can print braille' do
    test = @dictionary.dict["a"]
    expect(@dictionary.print_braille(test)).to eq ("0. .. ..")
  end

end

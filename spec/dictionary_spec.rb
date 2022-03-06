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

  # it 'can be inverted' do
  #   expect(@dictionary.braille.class).to eq Hash
  #   binding.pry
  #   expect(@dictionary.braille.length).to eq 39
  #   expect(@dictionary.braille.values.first).to eq "a"
  # end

end

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
    expect(@dictionary.dict.length).to eq 39
  end


end

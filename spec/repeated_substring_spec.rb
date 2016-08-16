require 'spec_helper'
require 'repeated_substring'

RSpec.describe 'repeated_substring' do
  before(:each) do
    @rs = RepeatedSubstring.new
  end

  it 'should find the substring in a single word' do
    expect(@rs.find_repeated_substring('banana')).to eq('an')
  end

  it 'should find repeated words in a sentence' do
    expect(@rs.find_repeated_substring('who is who and who comes next?')).to eq('who')
  end

  it 'should find the longest repetition' do
    expect(@rs.find_repeated_substring('who is who, what is what and whether is whether?')).to eq('whether')
  end

  it 'should find the first longest repetition' do
    expect(@rs.find_repeated_substring('who is who and why is why?')).to eq('who')
  end

  it 'should find the longest repetition if it\'s not the first repetition' do
    expect(@rs.find_repeated_substring('who then is then maybe then fun then who again')).to eq('then')
  end

  it 'should be case sensitive' do
    expect(@rs.find_repeated_substring('Who is who and is it there?')).to eq('is')
  end

  it 'should not count overlapping repetitions' do
    expect(@rs.find_repeated_substring('Wheveve')).to eq('ev')
  end

  it 'should return NONE if there are no repetitions longer than 1 charater' do
    expect(@rs.find_repeated_substring('No repeats her e')).to eq('NONE')
  end

  it 'should return NONE with the empty string' do
    expect(@rs.find_repeated_substring('')).to eq('NONE')
  end

  it 'should support non-ASCII characters' do
    expect(@rs.find_repeated_substring('perché ma perché')).to eq('perché')
  end

  it 'should find substring in same word' do
    expect(@rs.find_repeated_substring('thenthen')).to eq('then')
  end

  xit 'find the most repeated substring for every line of a file' do
    expect(RepeatedSubstring.new.find_repeated_substring_file('data/sample.txt')).to eq(['an', 'NONE', 'NONE', 'oo'])
  end
end

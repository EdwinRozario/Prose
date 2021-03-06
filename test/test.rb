# -*- coding: utf-8 -*-
# frozen_string_literal: true

require_relative '../lib/prose.rb'

test_words = ['لعربية', 'ಕನ್ನಡ', 'test', 'עִבְרִית', 'हिन्दी', 'fעִةಕt']
test_languages = [['arabic'], ['kannada'], ['latin'], ['hebrew'],['devanagari'],['latin', 'hebrew', 'arabic', 'kannada']]

test_words.each do |word|
  puts "#{word} : #{word.prose} : #{word.prose == test_languages[test_words.index(word)]}"
end

puts 'Method for language'
p test_words[3].hebrew? == true
p test_words[1].hebrew? == false
p test_words[4].devanagari? == true
p test_words[1].devanagari? == false
p test_words[5].hebrew? == true
p test_words[1].hebrew? == false

puts 'Method for pure language test'
p test_words[5].pure_hebrew? == false
p test_words[3].pure_hebrew? == true

puts 'Percentage of hebrew in word'
p test_words[5].percentage_of('hebrew') == 25
p test_words[2].percentage_of('latin') == 100

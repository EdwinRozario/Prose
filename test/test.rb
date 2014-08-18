# -*- coding: utf-8 -*-

require_relative "../lib/prose.rb"
#require 'prose'

test_words = ["لعربية", "ಕನ್ನಡ", "test", "עִבְרִית", "हिन्दी", "fעִةಕt"]
test_languages = [["arabic"], ["kannada"], ["latin"], ["hebrew"],["devanagari"],["latin", "hebrew", "arabic", "kannada"]]

test_words.each do |word|
  puts "#{word} : #{word.prose} : #{word.prose == test_languages[test_words.index(word)]}"
end

p test_words[3].hebrew? == true
p test_words[1].hebrew? == false

p test_words[4].devanagari? == true
p test_words[1].devanagari? == false

p test_words[5].hebrew?(pure = true) == false
p test_words[5].hebrew? == true
p test_words[1].hebrew? == false




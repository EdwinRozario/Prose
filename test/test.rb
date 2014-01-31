require_relative "../lib/prose.rb"

test_words = ["لعربية", "ಕನ್ನಡ", "test", "עִבְרִית", "हिन्दी", "fעִةಕt"]
test_languages = [["arabic"], ["kannada"], ["latin"], ["hebrew"],["devanagari"],["latin", "hebrew", "arabic", "kannada"]]

test_words.each do |word|
  puts "#{word} : #{word.prose?} : #{word.prose? == test_languages[test_words.index(word)]}"
end

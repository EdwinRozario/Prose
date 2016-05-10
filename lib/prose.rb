# -*- coding: utf-8 -*-
require 'yaml'

class String

  RANGES ||= YAML::load( File.open( "#{File.expand_path File.dirname(__FILE__)}/prose/prose.yaml" ) )
  LANGUAGES ||= RANGES.invert

  def prose
    find_origins_in(self)
  end

  # __method__ cannot individually identify each method defined dynamically with define_method
  # Since this clumsy fix 
  LANGUAGES.keys.each do |language|
    eval <<-EOM 
      def #{language.split('-').first}?(pure = false)
        language = __method__.to_s.gsub("?", "")
        result = find_languages_in(self)
        pure ? ((result - [language]).empty?) : (result.include? language)
      end
    EOM
  end

  def language_of ordinal, min_range, max_range
    (min_range.to_i(16) < ordinal) and (max_range.to_i(16) > ordinal)
  end

  def languages_of letter
    result = []
    int_ordinal = letter.ord
    RANGES.keys.each do |key|
      min, max = key.split("-")
      ordinal_in_range = language_of(int_ordinal, min, max)
      result << RANGES[key].split("-").first if ordinal_in_range #language_of(int_ordinal, min, max) #(min.to_i(16) < int_ordinal) and (max.to_i(16) > int_ordinal)
    end

    result
  end

  def find_origins_in word
    word.split('').map {|letter| languages_of(letter) unless (letter == " ")}.flatten.compact.uniq
  end

end

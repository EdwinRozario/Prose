# -*- coding: utf-8 -*-
require 'yaml'

class String

  RANGES ||= YAML::load( File.open( "#{File.expand_path File.dirname(__FILE__)}/prose/prose.yaml" ) )
  LANGUAGES ||= RANGES.invert

  def prose
    find_languages_in(self) # rename find_origin_of
  end

  # define_method "#{language}?" do
  #   self.is_language?
  # end

  # __method__ cannot individually identify each method defined dynamically with define_method
  # Since this clumsy fix 
  LANGUAGES.each do |language|
    eval <<-EOM 
      def #{language}?
        language = __method__.gsub("?", "")
        result = find_languages_in(self)
        (result - [language]).empty?
      end
    EOM
  end

  # private

  # def is_language?
  #   "input : #{self} | method : #{__method__}"
  # end

  # def unicode_ranges
  #   @ranges ||= YAML::load( File.open( "#{File.expand_path File.dirname(__FILE__)}/prose/prose.yaml" ) )
  # end

  def language_of ordinal, min_range, max_range
    (min_range.to_i(16) < ordinal) and (max_range.to_i(16) > ordinal)      
  end

  def languages_of letter
    result = []
    int_ordinal = letter.ord
    RANGES.keys.each do |key|
      min, max = key.split("-")
      result << RANGES[key].split("-").first if language_of(int_ordinal, min, max) #(min.to_i(16) < int_ordinal) and (max.to_i(16) > int_ordinal)
    end
    return result
  end

  def find_languages_in word
    result = []
    word.split('').each do |letter|
      result << languages_of(letter) if not letter == " "
    end
    return result.uniq
  end

end

# -*- coding: utf-8 -*-
require 'yaml'

class String

  RANGES ||= YAML::load( File.open( "#{File.expand_path File.dirname(__FILE__)}/prose/prose.yaml" ) )
  LANGUAGES ||= RANGES.values.uniq

  def prose
    find_languages_in(self) # rename find_origin_of
  end

  LANGUAGES.each do |language|
    eval <<-EOM 
      def "#{language}?"
        "input : #{self} | method : #{__method__}"
      end
    EOM
    # define_method "#{language}?" do
    #   self.is_language?
    # end
  end

  # private

  def is_language?
    "input : #{self} | method : #{__method__}"
  end

  # def unicode_ranges
  #   @ranges ||= YAML::load( File.open( "#{File.expand_path File.dirname(__FILE__)}/prose/prose.yaml" ) )
  # end

  def language_of letter
    p "language of"
    result = []
    int_ordinal = letter.ord
    RANGES.keys.each do |key|
      min, max = key.split("-")
      result << unicode_ranges[key] if (min.to_i(16) < int_ordinal) and (max.to_i(16) > int_ordinal)
    end
    p "result : #{result}"
    return result
  end

  def find_languages_in word
    result = []
    word.split('').each do |letter|
      result += language_of(letter) if not letter == " "
    end
    return result.uniq
  end

end

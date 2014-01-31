# -*- coding: utf-8 -*-
require 'yaml'

class String

  def prose?
    find_languages_in(self) 
  end

  private


  def unicode_ranges
    @ranges ||= YAML::load( File.open( "#{File.expand_path File.dirname(__FILE__)}/prose/prose.yaml" ) )
  end

  def language_of letter
    result = []
    int_ordinal = letter.ord
    unicode_ranges.keys.each do |key|
      min, max = key.split("-")
      result << unicode_ranges[key] if (min.to_i(16) < int_ordinal) and (max.to_i(16) > int_ordinal)
    end
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

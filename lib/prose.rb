# -*- coding: utf-8 -*-
# frozen_string_literal: true

require 'yaml'

# Ruby string class
class String
  CHAR_CODES ||= YAML::load( File.open( "#{File.expand_path File.dirname(__FILE__)}/prose/prose.yaml" ) )

  def prose
    find_origins_in(self)
  end

  CHAR_CODES['languages'].each do |language, ranges|
    method_name = "#{language}?"

    define_method(method_name) do
      chars.map { |char| char_belongs_to_language?(char, ranges) }.include? true
    end

    define_method("pure_#{method_name}") do
      chars.map { |char| char_belongs_to_language?(char, ranges) }.uniq == [true]
    end
  end

  def char_in_range?(ordinal, range)
    min_range, max_range = range.split('-')

    (min_range.to_i(16) < ordinal) && (max_range.to_i(16) > ordinal)
  end

  def char_belongs_to_language?(char, language_ranges)
    return true if char == ' '

    language_ranges.map { |range| char_in_range?(char.ord, range) }.include? true
  end

  def percentge_of(language)
    total_languages = find_origins_in(self)

    occurance_of_language = total_languages.count(language).to_f

    ((occurance_of_language / total_languages.count.to_f) * 100.0).to_i
  end

  def languages_of(letter)
    ranges = CHAR_CODES['ranges']

    ranges.keys.map do |key|
      ranges[key] if char_in_range?(letter.ord, key)
    end
  end

  def find_origins_in(word)
    word.chars.map { |letter| languages_of(letter) unless letter.empty? }.flatten.compact.uniq
  end
end

# -*- coding: utf-8 -*-
# frozen_string_literal: true

require 'yaml'

# Ruby string class
class String
  LAN_RANGES ||= YAML::load( File.open( "#{File.expand_path File.dirname(__FILE__)}/prose/prose.yaml" ) )

  def prose
    find_origins_in(self)
  end

  # Refactor this so that the dynamic methods no more use find_origins_in instead only check
  # the ranges for the specific language only
  LAN_RANGES.invert.keys.each do |language|
    language_name = language.split('-').first
    method_name = "#{language_name}?"

    define_method(method_name) do
      find_origins_in(self).include? language_name
    end

    define_method("pure_#{method_name}") do
      (find_origins_in(self) - [language_name]).empty?
    end
  end

  def language_of(ordinal, min_range, max_range)
    (min_range.to_i(16) < ordinal) && (max_range.to_i(16) > ordinal)
  end

  def languages_of(letter)
    LAN_RANGES.keys.map do |key|
      min, max = key.split('-')
      LAN_RANGES[key].split('-').first if language_of(letter.ord, min, max)
    end
  end

  def find_origins_in(word)
    word.split('').map { |letter| languages_of(letter) unless letter.empty? }.flatten.compact.uniq
  end
end

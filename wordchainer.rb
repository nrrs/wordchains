require 'set'

class WordChainer

  attr_reader :dictionary

  def initialize(dictionary_file_name)
    # @dictonary = File.readlines(dictionary_file_name).map(&:chomp)
    # @dictionary = Set.new(@dictionary)
    @dictonary = Set.new(File.readlines(dictionary_file_name).map(&:chomp))
  end

  def adjacent_words(word)

  end

end


if __FILE__ == $PROGRAM_NAME
  
end

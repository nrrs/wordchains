require 'set'

class WordChainer

  attr_reader :dictionary

  def initialize(dictionary_file_name)
    # @dictonary = File.readlines(dictionary_file_name).map(&:chomp)
    # @dictionary = Set.new(@dictionary)
    @dictionary = Set.new(File.readlines(dictionary_file_name).map(&:chomp))
  end

  def adjacent_words(word)
    adjacent_words = []
    alphabet = ('a'..'z')

    word.each_char.with_index do |letter1, i|
      alphabet.each do |letter2|
        next if letter1 == letter2

        test_word = word.dup
        test_word[i] = letter2

        adjacent_words << test_word if @dictionary.include? test_word
      end
    end
    p adjacent_words
  end

end


if __FILE__ == $PROGRAM_NAME
  start = WordChainer.new('dictionary.txt')
  start.adjacent_words('cat')
end

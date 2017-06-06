require 'set'

class WordChainer

  attr_reader :dictionary

  def initialize(dictionary_file_name)
    # @dictonary = File.readlines(dictionary_file_name).map(&:chomp)
    # @dictionary = Set.new(@dictionary)
    @dictionary = Set.new(File.readlines(dictionary_file_name).map(&:chomp))
  end

  def run(source, target)
    @current_words = [source]
    @all_seen_words = { source => nil }

    until @current_words.empty?
      new_current_words = []

      @current_words.each do |current_word|
        adjacent_words(current_word).each do |adjacent_word|
          next if @all_seen_words.include? target
          @all_seen_words[adjacent_word] = current_word
          new_current_words << adjacent_word
        end
      end
      print new_current_words
      @current_words = new_current_words
    end
    
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
    adjacent_words
  end

end


if __FILE__ == $PROGRAM_NAME
  start = WordChainer.new('dictionary.txt')
  start.run("duck", "ruby")
end

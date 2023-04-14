class DiaryEntry
  def initialize(title, contents) # title, contents are strings
    # ...
  end

  def title
    # Returns the title as a string
  end

  def contents
    # Returns the contents as a string
  end

  def count_words
    # Returns the number of words in the contents as an integer
  end

  def reading_time(wpm) # wpm is an integer representing
                        # the number of words the user can read per minute
    # Returns an integer representing an estimate of the reading time in minutes
    # for the contents at the given wpm.
  end

  def reading_chunk(wpm, minutes) # `wpm` is an integer representing the number
                                  # of words the user can read per minute
                                  # `minutes` is an integer representing the
                                  # number of minutes the user has to read
    # Returns a string with a chunk of the contents that the user could read
    # in the given number of minutes.
    # If called again, `reading_chunk` should return the next chunk, skipping
    # what has already been read, until the contents is fully read.
    # The next call after that it should restart from the beginning.
  end
end


#  def count_words
#     words.length
#   end

#   def reading_time(wpm) 
#     fail "Reading speed must be greater than 0" unless wpm.positive?
#     (count_words / wpm.to_f).ceil
#   end

#   def reading_chunk(wpm, minutes)
#     fail "Reading speed must be greater than 0" unless wpm.positive?
#     no_words_we_can_read = wpm * minutes
#     start_from = @furthest_word_read
#     end_at = start_from + no_words_we_can_read
#     word_list = words[start_from, end_at]
#     if end_at >= count_words
#       @furthest_word_read = 0
#     else
#       @furthest_word_read = end_at
#     end
#     return word_list.join(" ")
#   end

#   private

#   def words
#     @contents.split(" ")
#   end
# end
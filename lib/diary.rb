class Diary
  def initialize
    @diary_entries = []
  end

  def add(entry) # entry is an instance of DiaryEntry
    fail "Entry should be an instance of DiaryEntry" unless entry.is_a? DiaryEntry
    @diary_entries << entry
  end

  def all
    # Returns a list of instances of DiaryEntry
    return @diary_entries
  end

  def count_words
    # Returns the number of words in all diary entries
    # HINT: This method should make use of the `count_words` method on DiaryEntry.
    total_word_count = 0
    @diary_entries.each do |entry|
      total_word_count += entry.count_words
    end
    total_word_count
  end

  def reading_time(wpm) # wpm is an integer representing
                        # the number of words the user can read per minute
    # Returns an integer representing an estimate of the reading time in minutes
    # if the user were to read all entries in the diary.
    total_reading_time = 0
    @diary_entries.each do |entry|
      total_reading_time += entry.reading_time(wpm)
    end
    total_reading_time
  end

  def find_best_entry_for_reading_time(wpm, minutes)
        # `wpm` is an integer representing the number of words the user can read
        # per minute.
        # `minutes` is an integer representing the number of minutes the user
        # has to read.
    # Returns an instance of diary entry representing the entry that is closest 
    # to, but not over, the length that the user could read in the minutes they
    # have available given their reading speed.
  end
end
require 'diary_entry'
require 'diary'

RSpec.describe "Diary Integration" do

  context "if entry is not an instance of DiaryEntry" do
    it "fails" do
      diary = Diary.new
      expect { diary.add("String") }.to raise_error "Entry should be an instance of DiaryEntry"
    end
  end

  it "adds a DiaryEntry entry to the Diary" do
    diary_entry = DiaryEntry.new("Day 1", "Learning to design a class system")
    diary = Diary.new
    result = diary.add(diary_entry)
    expect(result).to eq [diary_entry]
  end

  it "displays all DiaryEntry instances within Diary" do
    diary_entry = DiaryEntry.new("Day 1", "Learning to design a class system")
    second_diary_entry = DiaryEntry.new("Day 2", "Using VSCode")
    diary = Diary.new
    diary.add(diary_entry)
    diary.add(second_diary_entry)
    result = diary.all
    expect(result).to eq [diary_entry, second_diary_entry]
  end

  it "counts the total number of words of all diary entries" do
    diary_entry = DiaryEntry.new("Day 1", "Learning to design a class system")
    second_diary_entry = DiaryEntry.new("Day 2", "Using VSCode")
    diary = Diary.new
    diary.add(diary_entry)
    diary.add(second_diary_entry)
    expect(diary.count_words).to eq 8
  end

  it "gives the total reading time for all diary entries" do
    diary_entry = DiaryEntry.new("Day 1", "Learning to design a class system")
    second_diary_entry = DiaryEntry.new("Day 2", "Using VSCode")
    diary = Diary.new
    diary.add(diary_entry)
    diary.add(second_diary_entry)
    result = diary.reading_time(2)
    expect(result).to eq 4
  end

  it "finding best entry for reading time" do
    diary_entry = DiaryEntry.new("Title_1", "word " * 100)
    second_diary_entry = DiaryEntry.new("Title_2", "word " * 200)
    diary = Diary.new
    diary.add(diary_entry)
    diary.add(second_diary_entry)
    result = diary.find_best_entry_for_reading_time(100, 1)
    expect(result).to eq diary_entry
  end

  it "finding best entry for reading time with three entries" do
    diary_entry = DiaryEntry.new("Title_1", "first " * 90)
    second_diary_entry = DiaryEntry.new("Title_2", "second " * 95)
    third_diary_entry = DiaryEntry.new("Title_3", "third " * 101)
    diary = Diary.new
    diary.add(diary_entry)
    diary.add(second_diary_entry)
    diary.add(third_diary_entry)
    result = diary.find_best_entry_for_reading_time(100, 1)
    expect(result).to eq second_diary_entry
  end

  # need to test for when there are no diary entries

end
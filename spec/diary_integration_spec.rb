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
end
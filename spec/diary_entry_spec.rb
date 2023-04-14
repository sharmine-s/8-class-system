# describe DiaryEntry do
#   it "constructs" do
#     diary_entry = DiaryEntry.new("my title", "my contents")
#     expect(diary_entry.title).to eq "my title"
#     expect(diary_entry.contents).to eq "my contents"
#   end

#   describe "#count_words" do
#     it "returns the number of words in the contents" do
#       diary_entry = DiaryEntry.new("my title", "some contents here")
#       expect(diary_entry.count_words).to eq 3
#     end

#     it "returns zero if the contents are empty" do
#       diary_entry = DiaryEntry.new("my title", "")
#       expect(diary_entry.count_words).to eq 0
#     end
#   end

#   describe "#reading_time" do
#     context "given a wpm of some sensible number (200)" do
#       it "returns the ceiling of the number of minutes it takes to read the contents" do
#         diary_entry = DiaryEntry.new("my title", "one " * 550)
#         expect(diary_entry.reading_time(200)).to eq 3
#       end
#     end

#     context "given a wpm of 0" do
#       it "fails" do
#         diary_entry = DiaryEntry.new("my title", "one " * 550)
#         expect { diary_entry.reading_time(0) }.to raise_error "Reading speed must be greater than 0"
#       end
#     end
#   end

#   describe "#reading_chunk" do
#     context "with a contents readable within the given minutes" do
#       it "returns the full contents" do
#         diary_entry = DiaryEntry.new("my title", "one two three")
#         expect(diary_entry.reading_chunk(200, 1)).to eq "one two three"
#       end
#     end

#     context "with a contents unreadable within the time" do
#       it "returns a readable chunk" do
#         diary_entry = DiaryEntry.new("my title", "one two three")
#         expect(diary_entry.reading_chunk(2, 1)).to eq "one two"
#       end

#       it "returns the next chunk, next time we are asked" do
#         diary_entry = DiaryEntry.new("my title", "one two three")
#         diary_entry.reading_chunk(2, 1)
#         chunk = diary_entry.reading_chunk(2, 1)
#         expect(chunk).to eq "three"
#       end

#       it "returns the next chunk, however many times asked" do
#         diary_entry = DiaryEntry.new("my title", "one two three four five six")
#         diary_entry.reading_chunk(2, 1)
#         diary_entry.reading_chunk(2, 1)
#         chunk = diary_entry.reading_chunk(2, 1)
#         expect(chunk).to eq "five six"
#       end

#       it "restarts after reading the whole contents" do
#         diary_entry = DiaryEntry.new("my title", "one two three")
#         diary_entry.reading_chunk(2, 1)
#         diary_entry.reading_chunk(2, 1)
#         chunk = diary_entry.reading_chunk(2, 1)
#         expect(chunk).to eq "one two"
#       end

#       it "restarts if it finishes exactly on the end" do
#         diary_entry = DiaryEntry.new("my title", "one two three four")
#         diary_entry.reading_chunk(2, 1)
#         diary_entry.reading_chunk(2, 1)
#         chunk = diary_entry.reading_chunk(2, 1)
#         expect(chunk).to eq "one two"
#       end
#     end

#     context "given a wpm of 0" do
#       it "fails" do
#         diary_entry = DiaryEntry.new("my title", "one two three")
#         expect { diary_entry.reading_chunk(0, 1) }.to raise_error "Reading speed must be greater than 0"
#       end
#     end
#   end
# end
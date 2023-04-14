Single-Class Programs Design Recipe
1. Describe the Problem

Typically you will be given a short statement that does this called a user story. In industry, you may also need to ask further questions to clarify aspects of the problem.
2. Design the Class Interface

The interface of a class includes:

    The name of the class.
    The design of its initializer and the parameters it takes.
    The design of its public methods, including:
        Their names and purposes
        What parameters they take and the data types.
        What they return and that data type
        Any side effects they might have.

Steps 3 and 4 then operate as a cycle.
3. Create Examples as Tests

DiaryEntry
title => "Day 1"
contents => "Learning to design a class system"
count_words => 6
reading_time(2) => 3
reading_chunk(200, 1) => "Learning to design a class system"

reading_chunk(2, 1) => "Learning a"
reading_chunk(4, 1) => "design a class system"
reading_chunk(2, 1) => "Learning a"

Diary
diary_entry = DiaryEntry.new("Day 1", "Learning to design a class system")
second_diary_entry = DiaryEntry.new("Day 2", "Using VSCode")
diary = Diary.new
diary.add(diary_entry) => returns nothing
diary.add(second_diary_entry)
diary.all => [ 
  "Day 1", "Learning to design a class system"
  "Day 2", "Using VSCode"
]
# need to test and see what these isntances would look like

These are examples of the class being used with different initializer arguments, method calls, and how it should behave.

For complex challenges you might want to come up with a list of examples first and then test-drive them one by one. For simpler ones you might just dive straight into writing a test for the first example you want to address.

    4. Implement the Behaviour

    For each example you create as a test, implement the behaviour that allows the class to behave according to your example.

    At this point you may wish to apply small-step test-driving to manage the complexity. This means you only write the minimum lines of the example to get the test to fail (red), then make it pass (green) and refactor, before adding another line to the test until it fails, then continue.

    Then return to step 3 until you have addressed the problem you were given. You may also need to revise your design, for example if you realise you made a mistake earlier.


# Questions
1. Why does the fail case recognize the DiaryEntry instance but when running the code in the Diary file, it doesn't allow us to create a variable of instance DiaryEntry?
2. 
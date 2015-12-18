#Question 1

#Let's do some "ASCII Art" (a stone-age form of nerd 
  # artwork from back in the days before computers had video screens).

# For this exercise, write a one-line program that 
# creates the following output 10 times, with the subsequent
#  line indented 1 space to the right:

# The Flintstones Rock!
#  The Flintstones Rock!
#   The Flintstones Rock!

10.times { |number| puts (" " * number) + "The Flintstones Rock!" }


# --------------------
# --------------------
# Question 2

# a hash that expresses the frequency with which each letter 
# occurs in this string:

statement = "The Flintstones Rock"

# ex:

{ "F"=>1, "R"=>1, "T"=>1, "c"=>1, "e"=>2, ... }

#answer:
statement = "The Flintstones Rock"
statement.delete(' ')
letter_array = statement.downcase.split("")


hash = {}
letter_array.each do |letter|
  letter_frequency = hash[letter]
  letter_frequency = letter_frequency.to_i + 1
  hash.store(letter, letter_frequency) #or: hash[letter] = letter_frequency
end

p hash


# --------------------
# --------------------
# Question 3

#The result of the following statement will be an error:

puts "the value of 40 + 2 is " + (40 + 2)
# Why is this and what are two possible ways to fix this?

#answer:
# you could add an extra set of quotation marks around the (40 + 2)
# you could also extend the quotation marks to include 40 + 2 and
# add a #{} if you wanted to calculate the answer to 40+2

# --------------------
# --------------------
# Question 4


# What happens when we modify an array while we are iterating over it?
#answer the next iteration is part of the modified array
# What would be output by this code?
# answer: the output would be => 1 3   and numbers would be [3, 4]
numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.shift(1)
end
#What would be output by this code?

#answer: the output would be => 1   2   and numbers would be [1, 2]
numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.pop(1)
end


# --------------------
# --------------------
# Question 5


# Alan wrote the following method, which was intended to 
# show all of the factors of the input number:

def factors(number)
  dividend = number
  divisors = []
  begin
    divisors << number / dividend if number % dividend == 0
    dividend -= 1
  end until dividend == 0
  divisors
end


#experimenting:


# Alyssa noticed that this will fail if you call this with 
# an input of 0 or a negative number and asked Alan to change
#  the loop. How can you change the loop construct (instead 
  # of using begin/end/until) to make this work? Note that we're
  #  not looking to find the factors for 0 or negative numbers, 
  # but we just want to handle it gracefully instead of raising an
  # exception or going into an infinite loop.

#answer:  you could modify line 7 and add the "or"  :    end until dividend == 0 || dividend < 0

def factors_refactored(number)
  dividend = number
  divisors = []
  begin
    divisors << number / dividend if number % dividend == 0
    dividend -= 1
  end until dividend == 0 || dividend < 0
  divisors
end
# Bonus 1

# What is the purpose of the number % dividend == 0 ?
# answer:  without % dividend == 0 is to ensure there are no remainders

# Bonus 2


# What is the purpose of the second-to-last line in the
# method (the divisors before the method's end)?
# answer: without the last divisors line, there wouldn't be anything
# that returned to the screen.

# --------------------
# --------------------
# Question 6


# Alyssa was asked to write an implementation of a rolling buffer.
#  Elements are added to the rolling buffer and if the buffer 
# becomes full, then new elements that are added will displace
# the oldest elements in the buffer.

# She wrote two implementations saying, "Take your pick. 
# Do you like << or + for modifying the buffer?".
#  Is there a difference between the two, other than what operator 
# she chose to use to add an element to the buffer?


#answer 
# irb returns nil
# this mutates the called, buffer will be changed
def rolling_buffer1(buffer, max_buffer_size, new_element)
  buffer << new_element
  buffer.shift if buffer.size >= max_buffer_size
  buffer
end

#answer
# irb returns nil
# this will not mutate the caller
def rolling_buffer2(input_array, max_buffer_size, new_element)
  buffer = input_array + [new_element]
  buffer.shift if buffer.size >= max_buffer_size
  buffer
end


# --------------------
# --------------------
# Question 7

# Alyssa asked Ben to write up a basic implementation of a
#  Fibonacci calculator, A user passes in two numbers, and
#  the calculator will keep computing the sequence until some 
# limit is reached.

# Ben coded up this implementation but complained that as
#  soon as he ran it, he got an error. Something about the limit 
# variable. What's wrong with the code?

limit = 15

def fib(first_num, second_num)
  while second_num < limit
    sum = first_num + second_num
    first_num = second_num
    second_num = sum
  end
  sum
end

result = fib(0, 1)
puts "result is #{result}"
# How would you fix this so that it works?

#answer: move limit into the method

# --------------------
# --------------------
# Question 8

# In another example we used some built-in string methods 
# to change the case of a string. A notably missing method is 
# something provided in Rails, but not in Ruby itself...titleize! 
# This method in Ruby on Rails creates a string that has each word
# capitalized as it would be in a title.

# Write your own version of the rails titleize implementation.
def testing(phrase)
  puts phrase.downcase.capitalize
end

puts testing("these ARE some words")


# --------------------
# --------------------
# Question 9

# Given the munsters hash below

munsters = { 
  "Herman" => { "age" => 32, "gender" => "male" }, 
  "Lily" => { "age" => 30, "gender" => "female" }, 
  "Grandpa" => { "age" => 402, "gender" => "male" }, 
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}
# Modify the hash such that each member of the Munster 
# family has an additional "age_group" key that has one of three 
# values describing the age group the family member is in (kid, 
  # adult, or senior). Your solution should produce the hash below

{ "Herman" => { "age" => 32, "gender" => "male", "age_group" => "adult" },
  "Lily" => {"age" => 30, "gender" => "female", "age_group" => "adult" },
  "Grandpa" => { "age" => 402, "gender" => "male", "age_group" => "senior" },
  "Eddie" => { "age" => 10, "gender" => "male", "age_group" => "kid" },
  "Marilyn" => { "age" => 23, "gender" => "female", "age_group" => "adult" } }

# Note: a kid is in the age range 0 - 17, an adult is in the 
# range 18 - 64 and a senior is aged 65+.

# hint: try using a case statement along with Ruby Range objects 
# in your solution




# my solution:

munsters.each do |munster_name, munster_data|
  age = munster_data["age"]
  age_group = nil
  if age < 18
    age_group = "kid"
  elsif age > 64
    age_group = "senior"
  else
    age_group = "adult"
  end
    munster_data.store("age_group", age_group)
end

p munsters

# (my first solution to problem)
munsters.each do |munster_name, munster_data|
  munster_data.store("age_group", nil)
  munster_data.each do |embedded_k, embedded_v|
    if embedded_k == "age"
      if embedded_v.to_i > 64
        munster_data.store("age_group", "senior")
      elsif embedded_v.to_i < 18
        munster_data.store("age_group", "kid")
      else
        munster_data.store("age_group", "adult")
      end
    end
  end
end

p munsters
#Question 1

#What would you expect the code below to print out?

numbers = [1, 2, 2, 3]
numbers.uniq

puts numbers

#Answer:  it should print out: 1 2 2 3

# -----------------------------------------
# -----------------------------------------
# Question 2

# Describe the difference between ! and ? in Ruby.
# => ! typically means not, or indicates mutating the caller
# => ? usually means to-check or "is-it" or "if/else"
# And explain what would happen in the following scenarios: 
# 1. what is != and where should you use it? 
# => "!=" means not-equal to 
# 2. put ! before something, like !user_name
# => turns the object into the opposite true or false/boolean
# 3. put ! after something, like words.uniq! 
# => .uniq! will modify the caller
# 4. put ? before something  
# => if/else operator
# 5. put ? after something
# => include? usually part of the method name
# 6. put !! before something, like !!user_name
# => turns the something into true or false/boolean

# -----------------------------------------
# -----------------------------------------
#Question 3

# Replace the word "important" with "urgent" in this string:

advice = "Few things in life are as important as house training your pet dinosaur."
advice_2 = advice.split
advice_2.each { |e| if (e == "important"); e.replace("urgent") end; }
advice = advice_2.join(" ")

puts advice


# -----------------------------------------
# -----------------------------------------
#Question 4
# The Ruby Array class has several methods for removing items
# from the array. Two of them have very similar names.
# Let's see how they differ:

numbers = [1, 2, 3, 4, 5]
# What does the follow method calls do 
# (assume we reset numbers to the original array between method calls)?
numbers.delete_at(1)
numbers.delete(1)


puts "numbers.delete_at(1) will return:"
puts "=> 2"
puts "and now the numbers array is:"
puts "[1, 3, 4, 5]"
puts "because the second element/(index value 1) in the array will be deleted."
puts "whereas with numbers.delete(1), the return will be:"
puts "=> 1"
puts "because the actual '1' was deleted"
puts "numbers array is now: [2, 3, 4, 5]"

# -----------------------------------------
# -----------------------------------------
#Question 5
(10..100).include?(42)

# -----------------------------------------
# -----------------------------------------
#Question 6

#Starting with the string:

famous_words = "seven years ago..."

# show two different ways to put the expected "Four score and " 
# in front of it.

# one option

fully_famous_words1 = "Four score and "
fully_famous_words2 = "Four score and "

# one option
puts fully_famous_words1 << famous_words

# a second option

puts fully_famous_words2 + famous_words

# -----------------------------------------
# -----------------------------------------
# Question 7

# Fun with gsub:

def add_eight(number)
  number + 8
end

number = 2

how_deep = "number"
5.times { how_deep.gsub!("number", "add_eight(number)") }

p how_deep
# This gives us a string that looks like a "recursive" method call:

"add_eight(add_eight(add_eight(add_eight(add_eight(number)))))"
# If we take advantage of Ruby's Kernel#eval method to have it
# execute this string as if it were a "recursive" method call

eval(how_deep)
# what will be the result?

# answer = 42

# -----------------------------------------
# -----------------------------------------
# Question 8
# If we build an array like this:

flintstones = ["Fred", "Wilma"]
flintstones << ["Barney", "Betty"]
flintstones << ["BamBam", "Pebbles"]
# We will end up with this "nested" array:

["Fred", "Wilma", ["Barney", "Betty"], ["BamBam", "Pebbles"]]
#Make this into an un-nested array.

#ANSWER:
flintstones.flatten!

# -----------------------------------------
# -----------------------------------------
# Question 9

# Given the hash below

flintstones = { "Fred" => 0, "Wilma" => 1, "Barney" => 2, "Betty" => 3, "BamBam" => 4, "Pebbles" => 5 }
# Turn this into an array containing only two elements:
# Barney's name and Barney's number
x = []

flintstones.map { |k, v| 
  if k == "Barney"
    x << k
    x << v
  end
  }

p x

# -----------------------------------------
# -----------------------------------------
# Question 10
# Given the array below

flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]
# Turn this array into a hash where the names are
# the keys and the values are the positions in the array.
new_hash = {}

flintstones.each_with_index do |i, v|
  new_hash[v] = i
end

p new_hash



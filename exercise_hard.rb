# Question 1

# What do you expect to happen when the greeting variable 
# is referenced in the last line of the code below?

if false
  greeting = “hello world”
end

greeting

# answer : nothing should happen ("nil") because we aren't calling a method
# and the "greeting = 'hello world'" is in the scope of the if block

# ----------------------------
# ----------------------------
# Question 2

# What is the result of the last line in the code below?

greetings = { a: 'hi' }
informal_greeting = greetings[:a]
informal_greeting << ' there'

puts informal_greeting  #  => "hi there"
puts greetings

# answer:  {:a=>"hi there"}



# ----------------------------
# ----------------------------
# Question 3

# In other exercises we have looked at how the scope of variables
#  affects the modification of one "layer" when they are passed to 
# another.

# To drive home the salient aspects of variable scope and
#  modification of one scope by another, consider the following 
# similar sets of code.

# What will be printed by each of these code groups?

# A)

def mess_with_vars(one, two, three)
  one = two
  two = three
  three = one
end

one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three)

puts "one is: #{one}"
puts "two is: #{two}"
puts "three is: #{three}"

# answer:  one is: one    two is: two   three is: three

# b)
def mess_with_vars(one, two, three)
  one = "two"
  two = "three"
  three = "one"
end

one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three)

puts "one is: #{one}"
puts "two is: #{two}"
puts "three is: #{three}"
# answer:  one is: one    two is: two   three is: three

# c)

def mess_with_vars(one, two, three)
  one.gsub!("one","two")
  two.gsub!("two","three")
  three.gsub!("three","one")
end

one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three)

puts "one is: #{one}"
puts "two is: #{two}"
puts "three is: #{three}"

# answer: one is: two  two is: three  three is: one

# ----------------------------
# ----------------------------
# Question 4

# A UUID is a type of identifier often used as a way to uniquely 
# identify items...which may not all be created by the same system. 
# That is, without any form of synchronization, two or more separate 
# computer systems can create new items and label them with a UUID 
# with no significant chance of stepping on each other's toes.

# It accomplishes this feat through massive randomization. 
# The number of possible UUID values is approximately 3.4 X 10E38.

# Each UUID consists of 32 hexadecimal characters, and is typically
#  broken into 5 sections like this 8-4-4-4-12 and represented as a
#  string.

# It looks like this: "f65c57f6-a6aa-17a8-faa1-a67f2dc9fa91"

# Write a method that returns one UUID when called with no parameters.

def sectionize_it
  hex_section = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 'a', 'b', 'c', 'd', 'e', 'f']

  chunk_1 = []
  chunk_2 = []
  chunk_3 = []
  chunk_4 = []
  chunk_5 = []

  8.times do |x|
    chunk_1 << hex_section.sample
  end

  4.times do |y|
    chunk_2 << hex_section.sample
  end

  4.times do |z|
    chunk_3 << hex_section.sample
  end

  4.times do |a|
    chunk_4 << hex_section.sample
  end

  12.times do |b|
    chunk_5 << hex_section.sample
  end

  puts "Your UUID is #{chunk_1.join("")}-#{chunk_2.join("")}-#{chunk_3.join("")}-#{chunk_4.join("")}-#{chunk_5.join("")}."
end

sectionize_it

# ----------------------------
# ----------------------------
# Question 5

# Ben was tasked to write a simple ruby method to determine if an
#  input string is an IP address representing dot-separated numbers. 
# e.g. "10.4.5.11". He is not familiar with regular expressions. 
# Alyssa supplied Ben with a method called is_a_number? to determine if a 
# string is a number and asked Ben to use it.

def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split(".")
  while dot_separated_words.size > 0 do
    word = dot_separated_words.pop
    break if !is_a_number?(word)
  end
  return true
end

# Alyssa reviewed Ben's code and says "It's a good start, 
# but you missed a few things. You're not returning a false condition, 
# and not handling the case that there are more or fewer than 4 components 
# to the IP address (e.g. "4.5.5" or "1.2.3.4.5" should be invalid)."

# Help Ben fix his code.

def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split(".")
  if dot_separated_words != 4
    return false
  end

  while dot_separated_words.size > 0 do
    word = dot_separated_words.pop
    if is_a_number?(word) == false
      return false
    end
  end
  return true
end











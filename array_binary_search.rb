NUMBERS = (1..1000000).to_a

# Use iteration across array to check for a match -> O(n)
def iterative_number_finder(numbers, target, steps)
  steps = 0

  numbers.each do |num|
    steps += 1

    if num == target
      return "It took #{steps} steps(s) to find #{target} with iteration!"
    end
  end

  puts "#{target} was not found!"
end

# Use recursive binary search to check for a match -> O(log n)
def b_tree_number_finder(numbers, target, steps)
  mid = (numbers.length - 1) / 2

  # puts "Index of the midpoint: #{mid}"
  # puts "Value at index: #{numbers[mid]}"

  if numbers[mid] == target
    "It took #{steps} step(s) to find #{target} with B-Tree!"
  elsif numbers.length == 1
    "#{target} was not found!"
  elsif numbers[mid] > target
    steps += 1
    b_tree_number_finder(numbers[0...mid], target, steps)
  else
    steps += 1
    b_tree_number_finder(numbers[(mid + 1)..-1], target, steps)
  end
end

require 'benchmark'

N = 999999

Benchmark.bm do |b|
  b.report {puts b_tree_number_finder(NUMBERS, N, steps = 1)}
  b.report {puts iterative_number_finder(NUMBERS, N, steps = 1)}
end

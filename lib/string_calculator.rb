class StringCalculator
  def self.add(numbers)
    return 0 if numbers.empty?
    
    # Split the input string by commas or newlines into an array of number strings
    num_array = numbers.split(/,|\n/)

    # Convert the array of number strings to an array of integers
    num_array = num_array.map(&:to_i)

    return num_array.sum
  end
end
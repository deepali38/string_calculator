class StringCalculator
  def self.add(numbers)
    return 0 if numbers.empty?

    if numbers.start_with?("//")
      delimiter, numbers = numbers[2..].split("\n", 2)
      delimiter = delimiter.gsub(/[\[\]]/, '')  # Remove brackets if present

      # Split the numbers using the custom delimiter
      num_array = numbers.split(delimiter)
    else
      # Split the input string by commas or newlines into an array of number strings
      num_array = numbers.split(/,|\n/)
    end

    # Convert the array of number strings to an array of integers
    num_array = num_array.map(&:to_i)

    negatives = num_array.select { |num| num < 0 }
    if negatives.any?
      raise "negatives not allowed: #{negatives.join(', ')}"
    end

    num_array = num_array.select { |num| num <= 1000 }

    return num_array.sum
  end
end
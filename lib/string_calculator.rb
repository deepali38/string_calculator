class StringCalculator
  def self.add(numbers)
    return 0 if numbers.empty?

    if numbers.start_with?("//")
      delimiters_part, numbers = numbers[2..].split("\n", 2)

      if delimiters_part.start_with?('[')
        delimiters = delimiters_part.scan(/\[([^\]]+)\]/).flatten
      else
        delimiters = [delimiters_part]
      end
      delimiters_pattern = delimiters.empty? ? /,|\n/ : Regexp.union(delimiters)
      num_array = numbers.split(delimiters_pattern)
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
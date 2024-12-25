require 'string_calculator'

RSpec.describe StringCalculator do
  describe '.add' do
    it 'returns 0 for an empty string' do
      expect(StringCalculator.add("")).to eq(0)
    end

    it 'returns the number itself for a single number' do
      expect(StringCalculator.add("1")).to eq(1)
    end

    it 'returns the sum for two numbers' do
      expect(StringCalculator.add("1,2")).to eq(3)
    end

    it 'handles newlines as delimiters' do
      expect(StringCalculator.add("1\n2,3")).to eq(6)
    end

    it 'supports custom delimiters' do
      expect(StringCalculator.add("//;\n1;2")).to eq(3)
    end

    it "throws an exception if a negative number is included" do
      expect { StringCalculator.add("1,-2") }.to raise_error("negatives not allowed: -2")
    end
  
    it "throws an exception for multiple negative numbers" do
      expect { StringCalculator.add("-1,2,-3") }.to raise_error("negatives not allowed: -1, -3")
    end

    it "ignores numbers larger than 1000" do
      expect(StringCalculator.add("2,1001")).to eq(2)
      expect(StringCalculator.add("1000,2000")).to eq(1000)
    end

    it "supports multiple custom delimiters" do
      expect(StringCalculator.add("//[;][%]\n1;2000%3")).to eq(6)
    end
  
    it "supports delimiters of length greater than one" do
      expect(StringCalculator.add("//[***]\n1***2***3")).to eq(6)
    end
  end
end

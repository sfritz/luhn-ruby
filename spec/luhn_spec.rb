require 'minitest/autorun'
require 'luhn'

describe Luhn do
  it "sums numbers in a digit" do
    Luhn.sum_of(10).must_equal 1
    Luhn.sum_of(22).must_equal 4
    Luhn.sum_of(99).must_equal 18
  end

  it "doubles numbers according to luhn" do
    Luhn.luhn_doubled(4992739871).must_equal [4,18,9,4,7,6,9,16,7,2]
    Luhn.luhn_doubled(123).must_equal [2,2,6]
    Luhn.luhn_doubled(700).must_equal [14,0,0]
  end

  it "provides a valid control number based on a number" do
    Luhn.checksum(123).must_equal 0
    Luhn.checksum(12345123451234).must_equal 8
    Luhn.checksum(4992739871).must_equal 6
    Luhn.checksum(23994700000053866078).must_equal 3
    Luhn.checksum(199600).must_equal 8
    Luhn.checksum(700).must_equal 5
  end

  it "validates valid numbers" do
    Luhn.valid?(123451234512348).must_equal true
    Luhn.valid?(1996008).must_equal true
    Luhn.valid?(1230).must_equal true
  end
end

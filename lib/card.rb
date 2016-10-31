class Card
  VALUES = ((1..9).map(&:to_s).to_a + %w{T J Q K A}).freeze
  SUITS = %w{H D C S}.freeze

  attr_accessor :value, :suit

  def initialize(string)
    return unless string.length == 2

    @value = string[0]
    @suit = string[1]
  end

  def valid?
    VALUES.include?(value) && SUITS.include?(suit)
  end

  # Numerical representation of card value, ranging from 0 to 13
  def index
    VALUES.index(value)
  end
end

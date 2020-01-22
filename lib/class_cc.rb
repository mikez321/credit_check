class CreditCard
  attr_reader :card_number, :limit, :card_ary
  def initialize(card_number, limit)
    @card_number = card_number
    @limit = limit
    @card_ary = card_number.split("").collect { |n| n.to_i}
  end

  def is_valid?
    a_evens = card_ary.select.with_index{ |value, index| index.even? }.collect{ |n| n * 2}
    a_odds = card_ary.select.with_index{ |value, index| index.odd?}

    non_splits = a_evens.select { |n| n < 10}
    splits = a_evens.select { |n| n >= 10 }.join("").split("").collect { |n| n.to_i}

    final = a_odds.reduce(:+) + non_splits.reduce(:+) + splits.reduce(:+)


    return "The number #{card_number} is valid!" if final % 10 == 0
    "The number #{card_number} is invalid!"
  end

  def last_four
    @card_ary[-4..-1].join""
  end

end

mike = CreditCard.new("5541808923795240", 15000)

puts mike.card_number
puts mike.limit
puts mike.last_four
puts mike.is_valid?

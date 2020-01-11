class CreditCard
  attr_reader :card_number, :limit
  def initialize(card_number, limit)
    @card_number = card_number
    @limit = limit
    @card_ary = card_number.split("").collect { |n| n.to_i}
  end

  def is_valid?
    a_evens = @card_ary.select.with_index{ |value, index| index % 2 == 0}.collect{ |n| n * 2}
    a_odds = @card_ary.select.with_index{ |value, index| index % 2 == 1}

    non_splits = a_evens.select { |n| n < 10}
    splits = a_evens.select { |n| n >= 10 }

    lhun1 = splits.join("").split("")
    lhun2 = lhun1.collect { |n| n.to_i }

    final = a_odds.reduce(:+) + non_splits.reduce(:+) + lhun2.reduce(:+)

    if final % 10 == 0
      "The number #{card_number} is valid!"
    else
      "The number #{card_number} is invalid!"
    end
  end

  def last_four
    @card_ary[-4..-1].join""
  end

end

mike = CreditCard.new("5541808923795240", 15000)

p mike.card_number
p mike.limit
p mike.last_four
p mike.is_valid?

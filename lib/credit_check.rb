card_number = "5541808923795240"

# Your Luhn Algorithm Here

a = card_number.split("").collect{|digits| digits.to_i }

a_evens = a.select.with_index{ |value, index| index.even? }.collect{ |n| n * 2}
a_odds = a.select.with_index{ |value, index| index.odd?}

non_splits = a_evens.select { |n| n < 10}
splits = a_evens.select { |n| n >= 10 }.join("").split("").collect { |n| n.to_i}

final = a_odds.reduce(:+) + non_splits.reduce(:+) + splits.reduce(:+)

if final % 10 == 0
  puts "The number #{card_number} is valid!"
else
  puts "the number #{card_number} is invalid!"
end


# Output
## If it is valid, print "The number [card number] is valid!"
## If it is invalid, print "The number [card number] is invalid!"

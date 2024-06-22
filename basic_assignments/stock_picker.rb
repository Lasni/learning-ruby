# frozen_string_literal: true

def stock_picker(prices)
  pairs_with_indexes = generate_pairs_with_indexes(prices)
  deals = []

  # construct an array of all possible deals
  # given the restriction that we go from left to right (can only sell after you buy)
  pairs_with_indexes.each do |pair|
    buy_day = pair[0]
    sell_day = pair[1]
    profit = -buy_day[0] + sell_day[0]
    profit_hash = { profit:, buy_index: buy_day[1], sell_index: sell_day[1] }
    deals << profit_hash
  end

  # find the best deal based on the :profit key in the hash
  deals.max_by { |deal| deal[:profit] }
end

def generate_pairs_with_indexes(array)
  # generates a nested array in the form of [[[17, 0], [3, 1]], [[17, 0], [6, 2]], ...]
  # first nested array is a combination two days (buy, sell)
  # second nested array is a value of the stock on a given day, and that day's index
  pairs_with_indexes = []

  array.each_with_index do |element1, index1|
    ((index1 + 1)...array.size).each do |index2|
      element2 = array[index2]
      pairs_with_indexes << [[element1, index1], [element2, index2]]
    end
  end

  pairs_with_indexes
end

puts(stock_picker([17, 3, 6, 9, 15, 8, 6, 1, 10])).inspect

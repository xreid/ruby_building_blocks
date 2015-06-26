# Receives an array of Fixnums representing stock prices on consecutive days,
# and returns a two element array with the first element being the best day
# (index of the price) to buy and the second being the best day to sell in
# order to maximize profits.
#
# Sample:
#   [1, 2, 3, 4]
#   => [0, 3]
# +prices+:: an array stock prices on consecutive days (e.g. [5, 8, 6, 12, 13]).
def stock_picker(prices)
  # handle erroneous input
  if !prices.is_a? Array
    return 'Please enter a valid array of prices (e.g. [1, 4, 2, 27]).'
  elsif prices.any? { |price| !(price.is_a? Fixnum) }
    return 'Please enter a valid array of prices (e.g. [1, 4, 2, 27]).'
  elsif prices.any? { |price| price < 0 }
  elsif prices.min == prices.max
    return 'The prices are the same each day!'
  end

  max_profit = 0
  buy_date = 0
  sell_date = 0

  prices.each do |buy_price|
    # increment within the index of the current buy_price and the end of the
    # prices array.
    prices[prices.index(buy_price)...-1].each do |sell_price|
      if sell_price - buy_price > max_profit
        max_profit = sell_price - buy_price
        buy_date = prices.index(buy_price)
        sell_date = prices.index(sell_price)
      end
    end
  end
  if buy_date == sell_date
    return "Sorry. There's no profit to be had here."
  end
  [buy_date, sell_date]
end

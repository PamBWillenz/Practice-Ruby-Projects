# frozen_string_literal: true

def stock_picker(prices)
  max_profit = 0
  buy_day = 0
  sell_day = 0
  prices.each_with_index do |buy_price, buy_index|
    prices[buy_index + 1..].each_with_index do |sell_price, sell_index|
      profit = sell_price - buy_price
      next unless profit > max_profit

      max_profit = profit
      buy_day = buy_index
      sell_day = sell_index + buy_index + 1
    end
  end
  [buy_day, sell_day]
end

def prices
  
end

p stock_picker([17, 3, 6, 9, 15, 8, 6, 1, 10]) # => [1,4]
p stock_picker([17, 3, 6, 9, 15, 8, 6, 1, 10, 20]) # => [7,9]

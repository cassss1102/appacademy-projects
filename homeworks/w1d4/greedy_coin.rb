def greedy_coin(num, coin_array, list_of_coins = [])
  return list_of_coins if num == 0
  i = 0
  until coin_array[i] <= num
    i += 1
  end
  num = num - coin_array[i]

  greedy_coin(num, coin_array, list_of_coins)
end

def greedy_coin(amount , coins)
  return [] if amount == 0
  i = 0
  until coins[i] <= amount
    i += 1
  end

  amount = amount - coins[i]
  return greedy_coin(amount, coins) << coins[i]
end

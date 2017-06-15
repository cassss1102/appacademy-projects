


def clever(fish)
  longest_fish = fish.first
  i = 1
  while i < fish.length
    if fish[i].length > longest_fish.length
      longest_fish = fish[i]
    end

    i += 1
  end

  longest_fish
end

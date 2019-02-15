def remove_dash_drink_names
  Drink.all.each do |drink|
    drink.name = drink.name.titleize.downcase
    drink.save
  end
end

def remove_spaces_name
  Drink.all.each do |drink|
    drink.name = drink.name.split.join(" ")
    drink.save
  end
end

# def add_difficulty
#   Drink.all.each do |drink|
#
#     drink.difficulty =
# end

def count_difficulties
  hash = {}
  i = 0
  while i < 20
    hash[i] = 0
    i += 1
  end
  Drink.all.each do |drink|
    hash[drink.ingredient_cards.count] += 1
  end
  puts hash
end

def build_difficulties
  Drink.all.each do |drink|
    if drink.ingredient_cards.count < 3
      drink.difficulty = "novice"
    elsif drink.ingredient_cards.count == 3 || drink.ingredient_cards.count == 4
      drink.difficulty = "intermediate"
    elsif drink.ingredient_cards.count == 5 || drink.ingredient_cards.count == 6
      drink.difficulty = "expert"
    else
      drink.difficulty = "alcoholic"
    end
    drink.save
  end
end

def clear_difficulties
  Drink.update_all("difficulty = NULL")
end

# sober (show all)
# buzzed < 6
# tipsy < 5
# drunk < 4
# is yellow a number? < 3
# show all

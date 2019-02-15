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

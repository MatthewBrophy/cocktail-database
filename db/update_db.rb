def remove_dash_drink_names
  Drink.all.each do |drink|
    drink.name.titleize.downcase
    drink.save
  end
end

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "open-uri"
require "json"

Ingredient.destroy_all

res = open("https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list")
json = JSON.parse(res.read)
json["drinks"].each do |drink|
    ingredient_name = drink["strIngredient1"]
    Ingredient.create!(name: ingredient_name)
end

Cocktail.create(name: "Margarita")
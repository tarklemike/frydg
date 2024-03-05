# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

puts "removing old data..."
Recipe.destroy_all
# Review.destroy_all
# User.destroy_all

puts "creating users..."
user_1 = User.create!(
  email: 'tarklemike@outlook.com',
  password: "123456",
  username: "tarklemike",
  first_name: "Mike",
  last_name: "Tarkleman",
  postcode: "SW8 2QP",
  image: ""
)


puts "creating ingredients database..."


bacon = Ingredient.create!(name: "bacon")
black_pepper = Ingredient.create!(name: "black pepper")
carrot = Ingredient.create!(name: "carrot")
chilli_flakes = Ingredient.create!(name: "chilli flakes")
chilli_green = Ingredient.create!(name: "green chilli")
coriander =  Ingredient.create!(name: "coriander")
coriander_ground = Ingredient.create!(name: "ground coriander")
cumin_seeds = Ingredient.create!(name: "cumin seeds")
eggs = Ingredient.create!(name: "eggs")
garlic = Ingredient.create!(name: "garlic")
ginger = Ingredient.create!(name: "ginger")
lentils = Ingredient.create!(name: "lentils")
mustard_seeds = Ingredient.create!(name: "mustard seeds")
oil_vegetable = Ingredient.create!(name: "vegetable oil")
onion = Ingredient.create!(name: "onion")
onion_red = Ingredient.create!(name: "red onion")
pasta = Ingredient.create!(name: "pasta")
potato = Ingredient.create!(name: "potato")
salt = Ingredient.create!(name: "salt")
spaghetti = Ingredient.create!(name: "spaghetti")
stock_vegetable = Ingredient.create!(name: "vegetable stock")
tumeric = Ingredient.create!(name: "tumeric")


puts "creating recipes..."

recipe_1 = Recipe.create!(
  title: "Dahl",
  description: "A delicious bowl of comfort",
  cusine: "Indian",
  vegetarian: true,
  vegan: true,
  gluten_free: true,
  dairy_free: true,
  egg_free: true,
  nut_free: true,
  prep_time: 20,
  cook_time: 120,
  level: "moderate",
  servings: 4,
  method: "STEP 1\n
  Wash the dahl until the water runs clear, then drain and put in a large pan and cover with the cold water.\n

  STEP 2\n
  Bring to the boil and skim off any scum that rises to the surface.\n

  STEP 3\n
  Add the ginger, turmeric and chopped chillies to the pan with a pinch of salt.\n

  STEP 4\n
  Turn down the heat, cover, leaving the lid slightly ajar.\n

  STEP 5\n
  Turn down the heat, cover, leaving the lid slightly ajar.\n

  STEP 6\n
  Simmer very gently for about 1.5 hours, stirring occasionally (stir vigorously near the end to see if it has become creamy). If using red lentils, the simmering time will likely be less.\n

  STEP 7\n
  Meanwhile, heat the oil in a frying pan over a medium heat and add the onions.\n

  STEP 8\n
  Stir until golden and beginning to crisp (brown but not burnt), then add dried spices and cook for a couple of minutes until the mustard seeds are beginning to pop. Add the garlic last.\n

  STEP 9\n
  Tip the onions over the dahl, stir in and top with chopped coriander. The dahl will keep warm for about 30 minutes",
  image: "",
  user_id: user_1
)
RecipeIngredient.create!(
  recipe_id: recipe_1,
  ingredient_id: lentils,
  amount: 400,
  measurement_type: "g"
)
RecipeIngredient.create!(
  recipe_id: recipe_1,
  ingredient_id: garlic,
  amount: 4,
  measurement_type: "cloves"
)
RecipeIngredient.create!(
  recipe_id: recipe_1,
  ingredient_id: ginger,
  amount: 4,
  measurement_type: "cm"
)
RecipeIngredient.create!(
  recipe_id: recipe_1,
  ingredient_id: tumeric,
  amount: 1,
  measurement_type: "tbsp"
)
RecipeIngredient.create!(
  recipe_id: recipe_1,
  ingredient_id: chilli_green,
  amount: 4,
  measurement_type: ""
)
RecipeIngredient.create!(
  recipe_id: recipe_1,
  ingredient_id: oil_vegetable,
  amount: 4,
  measurement_type: "tbsp"
)
RecipeIngredient.create!(
  recipe_id: recipe_1,
  ingredient_id: onion_red,
  amount: 2,
  measurement_type: ""
)
RecipeIngredient.create!(
  recipe_id: recipe_1,
  ingredient_id: cumin_seeds,
  amount: 1,
  measurement_type: "tsp"
)
RecipeIngredient.create!(
  recipe_id: recipe_1,
  ingredient_id: mustard_seeds,
  amount: 1,
  measurement_type: "tsp"
)
RecipeIngredient.create!(
  recipe_id: recipe_1,
  ingredient_id: chilli_flakes,
  amount: 1,
  measurement_type: "tsp"
)
RecipeIngredient.create!(
  recipe_id: recipe_1,
  ingredient_id: coriander,
  amount: 30,
  measurement_type: "g"
)

recipe_2 = Recipe.create!(
  title: "Carrot & coriander soup",
  description: "Everyone loves this super healthy soup, perfect for an easy supper",
  cusine: "British",
  vegetarian: true,
  vegan: true,
  gluten_free: true,
  dairy_free: true,
  egg_free: true,
  nut_free: false,
  prep_time: 15,
  cook_time: 25,
  level: "easy",
  servings: 4,
  method: "STEP 1\n
  Heat 1 tbsp vegetable oil in a large pan, add 1 chopped onion, then fry for 5 mins until softened.\n

  STEP 2\n
  Stir in 1 tsp ground coriander and 1 chopped potato, then cook for 1 min.\n

  STEP 3\n
  Add the 450g peeled and chopped carrots and 1.2l vegetable or chicken stock, bring to the boil, then reduce the heat.\n

  STEP 4\n
  Cover and cook for 20 mins until the carrots are tender.\n

  STEP 5\n
  Tip into a food processor with a handful of coriander then blitz until smooth (you may need to do this in two batches). Return to pan, taste, add salt if necessary, then reheat to serve.",
  image:
)
RecipeIngredient.create!(
  recipe_id: recipe_2,
  ingredient_id: oil_vegetable,
  amount: 1,
  measurement_type: "tbsp"
)
RecipeIngredient.create!(
  recipe_id: recipe_2,
  ingredient_id: onion,
  amount: 1,
  measurement_type: ""
)
RecipeIngredient.create!(
  recipe_id: recipe_2,
  ingredient_id: coriander_ground,
  amount: 1,
  measurement_type: "tsp"
)
RecipeIngredient.create!(
  recipe_id: recipe_2,
  ingredient_id: potato,
  amount: 1,
  measurement_type: ""
)
RecipeIngredient.create!(
  recipe_id: recipe_2,
  ingredient_id: carrot,
  amount: 450,
  measurement_type: "g"
)
RecipeIngredient.create!(
  recipe_id: recipe_2,
  ingredient_id: stock_vegetable,
  amount: 1.2,
  measurement_type: "l"
)
RecipeIngredient.create!(
  recipe_id: recipe_2,
  ingredient_id: coriander,
  amount: 15,
  measurement_type: "g"
)

recipe_3 = Recipe.create!(
  title: "Spaghetti Carbonara",
  description: "A classic Italian pasta dish with creamy sauce and crispy bacon.",
  cuisine: "Italian",
  vegetarian: false,
  vegan: false,
  gluten_free: false,
  dairy_free: false,
  egg_free: false,
  nut_free: true,
  prep_time: 10,
  cook_time: 15,
  level: "easy",
  servings: 2,
  method: "STEP 1\n
  Cook spaghetti according to package instructions until al dente. Reserve 1/2 cup of pasta water before draining.\n

  STEP 2\n
  In a pan, cook bacon until crispy. Remove bacon from pan and set aside. Discard excess bacon grease, leaving about 1 tablespoon in the pan.\n

  STEP 3\n
  In the same pan, add minced garlic and cook until fragrant.\n

  STEP 4\n
  Add cooked spaghetti to the pan with garlic. Toss to combine.\n

  STEP 5\n
  In a small bowl, whisk together eggs, grated Parmesan cheese, and black pepper.\n

  STEP 6\n
  Pour egg mixture over the spaghetti and quickly toss until the eggs thicken and coat the pasta. If the sauce is too thick, add reserved pasta water gradually.\n

  STEP 7\n
  Crumble the cooked bacon and sprinkle over the spaghetti. Serve hot with extra Parmesan cheese if desired.",
  image: "",
  user_id: user_2
)
RecipeIngredient.create!(
  recipe_id: recipe_2,
  ingredient_id: spaghetti,
  amount: 200,
  measurement_type: "g"
)
RecipeIngredient.create!(
  recipe_id: recipe_2,
  ingredient_id: bacon,
  amount: 100,
  measurement_type: "g"
)
RecipeIngredient.create!(
  recipe_id: recipe_2,
  ingredient_id: garlic,
  amount: 2,
  measurement_type: "cloves"
)
RecipeIngredient.create!(
  recipe_id: recipe_2,
  ingredient_id: eggs,
  amount: 2,
  measurement_type: ""
)
RecipeIngredient.create!(
  recipe_id: recipe_2,
  ingredient_id: parmesan,
  amount: 50,
  measurement_type: "g"
)
RecipeIngredient.create!(
  recipe_id: recipe_2.id,
  ingredient_id: black_pepper,
  amount: 1,
  measurement_type: "tsp"
)





recipe = Recipe.create!(
  title: ,
  description: ,
  cusine: ,
  vegetarian: true,
  vegan: true,
  gluten_free: true,
  dairy_free: true,
  egg_free: true,
  nut_free: true,
  prep_time: ,
  cook_time: ,
  level: ,
  servings: ,
  method: ,
  image:
)
recipe_ingredient = RecipeIngredient.create!(
  recipe_id: ,
  ingredient_id: ,
  amount:
)

# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require 'open-uri'

puts "removing old data..."

Recipe.destroy_all
# Review.destroy_all
User.destroy_all

puts "creating users..."
user_1 = User.create(
  email: 'tarklemike@outlook.com',
  password: "123456",
  username: "tarklemike",
  first_name: "Mike",
  last_name: "Tarkleman",
  postcode: "SW8 2QP",
  image: ""
)
user_2 = User.create(
  email: 'test@test.com',
  password: "123456",
  username: "test",
  first_name: "Big",
  last_name: "Poppa",
  postcode: "E17",
  image: ""
)
user_2_image = URI.open("https://upload.wikimedia.org/wikipedia/en/a/a5/Donald_Duck_angry_transparent_background.png")
user_2.photo.attach(io: user_2_image, filename: 'donald.jpg', content_type: "image/jpeg")
user_2.save



puts "creating ingredients database..."

bacon = Ingredient.create!(name: "bacon")
bamboo_shoots = Ingredient.create!(name: "bamboo shoots")
basil = Ingredient.create!(name: "basil")
bean_sprouts = Ingredient.create!(name: "bean sprouts")
black_pepper = Ingredient.create!(name: "black pepper")
carrot = Ingredient.create!(name: "carrot")
cheese_parmesan = Ingredient.create!(name: "parmesan")
chicken = Ingredient.create!(name: "chicken")
chilli_flakes = Ingredient.create!(name: "chilli flakes")
chilli_green = Ingredient.create!(name: "green chilli")
coconut_milk =  Ingredient.create!(name: "coconut_milk")
coriander =  Ingredient.create!(name: "coriander")
coriander_ground = Ingredient.create!(name: "ground coriander")
cream = Ingredient.create!(name: "cream")
cumin_seeds = Ingredient.create!(name: "cumin seeds")
egg = Ingredient.create!(name: "egg")
garlic = Ingredient.create!(name: "garlic")
ginger = Ingredient.create!(name: "ginger")
green_curry_paste = Ingredient.create!(name: "green curry paste")
lemon_juice = Ingredient.create!(name: "lemon juice")
lemon_wedge = Ingredient.create!(name: "lemon wedges")
lime_juice = Ingredient.create!(name: "lime juice")
lime_wedge = Ingredient.create!(name: "lime wedges")
lentils = Ingredient.create!(name: "lentils")
mirin = Ingredient.create!(name: "mirin")
mozzarella = Ingredient.create!(name: "mozzarella")
mussels = Ingredient.create!(name: "mussels")
mustard_seeds = Ingredient.create!(name: "mustard seeds")
noodles_rice = Ingredient.create!(name: "rice noodles")
oil_vegetable = Ingredient.create!(name: "vegetable oil")
oil_olive = Ingredient.create!(name: "olive oil")
onion = Ingredient.create!(name: "onion")
onion_red = Ingredient.create!(name: "red onion")
pad_thai_sauce = Ingredient.create!(name: "pad Thai sauce")
parsley = Ingredient.create!(name: "parsley")
pasta = Ingredient.create!(name: "pasta")
peanuts = Ingredient.create!(name: "peanuts")
potato = Ingredient.create!(name: "potato")
prawns = Ingredient.create!(name: "prawns")
red_pepper = Ingredient.create!(name: "red pepper")
rice_basmati = Ingredient.create!(name: "basmati rice")
rice_short_grain = Ingredient.create!(name: "short-grain rice")
saffron = Ingredient.create!(name: "saffron")
sake = Ingredient.create!(name: "sake")
salt = Ingredient.create!(name: "salt")
sesame_seeds = Ingredient.create!(name: "sesame seeds")
soy_sauce = Ingredient.create!(name: "soy sauce")
spaghetti = Ingredient.create!(name: "spaghetti")
spring_onion = Ingredient.create!(name: "spring onion")
squid = Ingredient.create!(name: "squid")
stock_vegetable = Ingredient.create!(name: "vegetable stock")
sugar = Ingredient.create!(name: "sugar")
tofu = Ingredient.create!(name: "tofu")
tomato = Ingredient.create!(name: "tomato")
tomato_sauce = Ingredient.create!(name: "tomato sauce")
tumeric = Ingredient.create!(name: "tumeric")
vinegar_balsamic = Ingredient.create!(name: "balsamic vinegar")
yoghurt = Ingredient.create!(name: "yoghurt")



puts "creating recipes..."

recipe_1 = Recipe.create!(
  title: "Dahl",
  description: "A delicious bowl of comfort",
  cuisine: "Indian",
  vegetarian: true,
  vegan: true,
  gluten_free: true,
  dairy_free: true,
  egg_free: true,
  nut_free: true,
  prep_time: 20,
  cook_time: 120,
  level: "Medium",
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
  image_url: "https://thecheekychickpea.com/wp-content/uploads/2022/09/red-lentil-dahl-1.jpg",
  user: user_1
)
RecipeIngredient.create!(
  recipe: recipe_1,
  ingredient: lentils,
  amount: 400,
  measurement_type: "g"
)
RecipeIngredient.create!(
  recipe: recipe_1,
  ingredient: garlic,
  amount: 4,
  measurement_type: "cloves"
)
RecipeIngredient.create!(
  recipe: recipe_1,
  ingredient: ginger,
  amount: 4,
  measurement_type: "cm"
)
RecipeIngredient.create!(
  recipe: recipe_1,
  ingredient: tumeric,
  amount: 1,
  measurement_type: "tbsp"
)
RecipeIngredient.create!(
  recipe: recipe_1,
  ingredient: chilli_green,
  amount: 4,
  measurement_type: ""
)
RecipeIngredient.create!(
  recipe: recipe_1,
  ingredient: oil_vegetable,
  amount: 4,
  measurement_type: "tbsp"
)
RecipeIngredient.create!(
  recipe: recipe_1,
  ingredient: onion_red,
  amount: 2,
  measurement_type: ""
)
RecipeIngredient.create!(
  recipe: recipe_1,
  ingredient: cumin_seeds,
  amount: 1,
  measurement_type: "tsp"
)
RecipeIngredient.create!(
  recipe: recipe_1,
  ingredient: mustard_seeds,
  amount: 1,
  measurement_type: "tsp"
)
RecipeIngredient.create!(
  recipe: recipe_1,
  ingredient: chilli_flakes,
  amount: 1,
  measurement_type: "tsp"
)
RecipeIngredient.create!(
  recipe: recipe_1,
  ingredient: coriander,
  amount: 30,
  measurement_type: "g"
)


recipe_2 = Recipe.create!(
  title: "Carrot & coriander soup",
  description: "Everyone loves this super healthy soup, perfect for an easy supper",
  cuisine: "British",
  vegetarian: true,
  vegan: true,
  gluten_free: true,
  dairy_free: true,
  egg_free: true,
  nut_free: false,
  prep_time: 15,
  cook_time: 25,
  level: "Easy",
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
  image: "",
  image_url: "https://images.immediate.co.uk/production/volatile/sites/30/2010/12/carrot-and-coriander-soup-recipe-e71fd8f.jpg?quality=90&webp=true&resize=600,545",
  user: user_1
)
RecipeIngredient.create!(
  recipe: recipe_2,
  ingredient: oil_vegetable,
  amount: 1,
  measurement_type: "tbsp"
)
RecipeIngredient.create!(
  recipe: recipe_2,
  ingredient: onion,
  amount: 1,
  measurement_type: ""
)
RecipeIngredient.create!(
  recipe: recipe_2,
  ingredient: coriander_ground,
  amount: 1,
  measurement_type: "tsp"
)
RecipeIngredient.create!(
  recipe: recipe_2,
  ingredient: potato,
  amount: 1,
  measurement_type: ""
)
RecipeIngredient.create!(
  recipe: recipe_2,
  ingredient: carrot,
  amount: 450,
  measurement_type: "g"
)
RecipeIngredient.create!(
  recipe: recipe_2,
  ingredient: stock_vegetable,
  amount: 1.2,
  measurement_type: "l"
)
RecipeIngredient.create!(
  recipe: recipe_2,
  ingredient: coriander,
  amount: 15,
  measurement_type: "g"
)


recipe_3 = Recipe.create!(
  title: "Caprese Salad",
  description: "A simple and refreshing Italian salad featuring tomatoes, fresh mozzarella, and basil.",
  cuisine: "Italian",
  vegetarian: true,
  vegan: false,
  gluten_free: true,
  dairy_free: false,
  egg_free: true,
  nut_free: true,
  prep_time: 10,
  cook_time: 0,
  level: "Easy",
  servings: 2,
  method: "STEP 1\n
  Slice tomatoes and fresh mozzarella cheese into equal-sized slices.\n

  STEP 2\n
  Arrange tomato and mozzarella slices on a plate, alternating them.\n

  STEP 3\n
  Sprinkle fresh basil leaves over the tomatoes and mozzarella.\n

  STEP 4\n
  Drizzle with extra virgin olive oil and balsamic vinegar.\n

  STEP 5\n
  Season with salt and black pepper to taste.\n

  STEP 6\n
  Serve immediately as a side dish or appetizer.",
  image: "",
  image_url: "https://i2.wp.com/www.downshiftology.com/wp-content/uploads/2019/07/Caprese-Salad-main-1.jpg",
  user: user_1
)
RecipeIngredient.create!(
  recipe: recipe_3,
  ingredient: tomato,
  amount: 2,
  measurement_type: ""
)
RecipeIngredient.create!(
  recipe: recipe_3,
  ingredient: mozzarella,
  amount: 125,
  measurement_type: "g"
)
RecipeIngredient.create!(
  recipe: recipe_3,
  ingredient: basil,
  amount: 10,
  measurement_type: "leaves"
)
RecipeIngredient.create!(
  recipe: recipe_3,
  ingredient: oil_olive,
  amount: 1,
  measurement_type: "tbsp"
)
RecipeIngredient.create!(
  recipe: recipe_3,
  ingredient: vinegar_balsamic,
  amount: 1,
  measurement_type: "tbsp"
)
RecipeIngredient.create!(
  recipe: recipe_3,
  ingredient: salt,
  amount: nil,
  measurement_type: "to taste"
)
RecipeIngredient.create!(
  recipe: recipe_3,
  ingredient: black_pepper,
  amount: nil,
  measurement_type: "to taste"
)


recipe_4 = Recipe.create!(
  title: "Chicken Tikka Masala",
  description: "A popular Indian dish featuring marinated chicken in a creamy tomato sauce.",
  cuisine: "Indian",
  vegetarian: false,
  vegan: false,
  gluten_free: false,
  dairy_free: false,
  egg_free: true,
  nut_free: true,
  prep_time: 20,
  cook_time: 30,
  level: "Medium",
  servings: 4,
  method: "STEP 1\n
  Marinate chicken pieces in yogurt, lemon juice, and spices for at least 1 hour.\n

  STEP 2\n
  Grill or broil marinated chicken until cooked through.\n

  STEP 3\n
  In a separate pan, heat oil and sauté onions until translucent. Add minced garlic and ginger and cook until fragrant.\n

  STEP 4\n
  Add tomato sauce, cream, and spices to the pan. Simmer for a few minutes.\n

  STEP 5\n
  Add cooked chicken to the sauce and simmer until flavors meld.\n

  STEP 6\n
  Garnish with fresh cilantro and serve with rice or naan.",
  image: "",
  image_url: "https://www.seriouseats.com/thmb/DbQHUK2yNCALBnZE-H1M2AKLkok=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/chicken-tikka-masala-for-the-grill-recipe-hero-2_1-cb493f49e30140efbffec162d5f2d1d7.JPG",
  user: user_2
)
RecipeIngredient.create!(
  recipe: recipe_4,
  ingredient: chicken,
  amount: 500,
  measurement_type: "g"
)
RecipeIngredient.create!(
  recipe: recipe_4,
  ingredient: yoghurt,
  amount: 150,
  measurement_type: "g"
)
RecipeIngredient.create!(
  recipe: recipe_4,
  ingredient: lemon_juice,
  amount: 2,
  measurement_type: "tbsp"
)
RecipeIngredient.create!(
  recipe: recipe_4,
  ingredient: onion,
  amount: 1,
  measurement_type: ""
)
RecipeIngredient.create!(
  recipe: recipe_4,
  ingredient: garlic,
  amount: 2,
  measurement_type: "cloves"
)
RecipeIngredient.create!(
  recipe: recipe_4,
  ingredient: ginger,
  amount: 2,
  measurement_type: "cm"
)
RecipeIngredient.create!(
  recipe: recipe_4,
  ingredient: tomato_sauce,
  amount: 200,
  measurement_type: "g"
)
RecipeIngredient.create!(
  recipe: recipe_4,
  ingredient: cream,
  amount: 100,
  measurement_type: "ml"
)
RecipeIngredient.create!(
  recipe: recipe_4,
  ingredient: coriander,
  amount: 10,
  measurement_type: "g"
)
RecipeIngredient.create!(
  recipe: recipe_4,
  ingredient: rice_basmati,
  amount: 1,
  measurement_type: "cup"
)


recipe_5 = Recipe.create!(
  title: "Pad Thai",
  description: "A popular Thai stir-fried noodle dish featuring rice noodles, prawns, tofu, and peanuts.",
  cuisine: "Thai",
  vegetarian: false,
  vegan: false,
  gluten_free: true,
  dairy_free: true,
  egg_free: false,
  nut_free: false,
  prep_time: 20,
  cook_time: 15,
  level: "Easy",
  servings: 4,
  method: "STEP 1\n
  Soak rice noodles in warm water until softened. Drain and set aside.\n

  STEP 2\n
  In a wok or large skillet, heat oil and sauté garlic and tofu until golden brown.\n

  STEP 3\n
  Add prawns and cook until pink. Push everything to one side of the wok.\n

  STEP 4\n
  Crack eggs into the wok and scramble until cooked.\n

  STEP 5\n
  Add drained rice noodles and stir-fry with the other ingredients.\n

  STEP 6\n
  Stir in Pad Thai sauce and bean sprouts. Cook until heated through.\n

  STEP 7\n
  Serve hot, garnished with crushed peanuts, chopped spring onions, and lime wedges.",
  image: "",
  image_url: "https://www.kitchensanctuary.com/wp-content/uploads/2019/07/Pad-Thai-square-FS-29.jpg",
  user: user_2
)
RecipeIngredient.create!(
  recipe: recipe_5,
  ingredient: noodles_rice,
  amount: 200,
  measurement_type: "g"
)
RecipeIngredient.create!(
  recipe: recipe_5,
  ingredient: oil_vegetable,
  amount: 2,
  measurement_type: "tbsp"
)
RecipeIngredient.create!(
  recipe: recipe_5,
  ingredient: garlic,
  amount: 2,
  measurement_type: "cloves"
)
RecipeIngredient.create!(
  recipe: recipe_5,
  ingredient: tofu,
  amount: 200,
  measurement_type: "g"
)
RecipeIngredient.create!(
  recipe: recipe_5,
  ingredient: prawns,
  amount: 200,
  measurement_type: "g"
)
RecipeIngredient.create!(
  recipe: recipe_5,
  ingredient: egg,
  amount: 2,
  measurement_type: ""
)
RecipeIngredient.create!(
  recipe: recipe_5,
  ingredient: pad_thai_sauce,
  amount: 100,
  measurement_type: "ml"
)
RecipeIngredient.create!(
  recipe: recipe_5,
  ingredient: bean_sprouts,
  amount: 100,
  measurement_type: "g"
)
RecipeIngredient.create!(
  recipe: recipe_5,
  ingredient: peanuts,
  amount: 50,
  measurement_type: "g"
)
RecipeIngredient.create!(
  recipe: recipe_5,
  ingredient: spring_onion,
  amount: "to taste",
  measurement_type: ""
)
RecipeIngredient.create!(
  recipe: recipe_5,
  ingredient: lime_wedge,
  amount: "to taste",
  measurement_type: ""
)


recipe_6 = Recipe.create!(
  title: "Chicken Teriyaki",
  description: "A delicious Japanese dish featuring tender chicken marinated in a sweet and savory teriyaki sauce.",
  cuisine: "Japanese",
  vegetarian: false,
  vegan: false,
  gluten_free: true,
  dairy_free: true,
  egg_free: true,
  nut_free: true,
  prep_time: 15,
  cook_time: 15,
  level: "Easy",
  servings: 2,
  method: "STEP 1\n
  In a bowl, mix together soy sauce, mirin, sake, and sugar to make the teriyaki sauce.\n

  STEP 2\n
  Cut chicken breasts into bite-sized pieces and marinate in the teriyaki sauce for 10-15 minutes.\n

  STEP 3\n
  Heat oil in a pan over medium-high heat.\n

  STEP 4\n
  Add the marinated chicken pieces and cook until golden brown and cooked through.\n

  STEP 5\n
  Serve the chicken teriyaki hot over steamed rice, garnished with sesame seeds and chopped spring onions.",
  image: "",
  image_url: "https://cjeatsrecipes.com/wp-content/uploads/2022/04/Teriyaki-Chicken-Cover-min-500x500.jpg",
  user: user_2
)

RecipeIngredient.create!(
  recipe: recipe_6,
  ingredient: soy_sauce,
  amount: 3,
  measurement_type: "tbsp"
)
RecipeIngredient.create!(
  recipe: recipe_6,
  ingredient: mirin,
  amount: 2,
  measurement_type: "tbsp"
)
RecipeIngredient.create!(
  recipe: recipe_6,
  ingredient: sake,
  amount: 2,
  measurement_type: "tbsp"
)
RecipeIngredient.create!(
  recipe: recipe_6,
  ingredient: sugar,
  amount: 1,
  measurement_type: "tbsp"
)
RecipeIngredient.create!(
  recipe: recipe_6,
  ingredient: chicken,
  amount: 300,
  measurement_type: "g"
)
RecipeIngredient.create!(
  recipe: recipe_6,
  ingredient: oil_vegetable,
  amount: 1,
  measurement_type: "tbsp"
)
RecipeIngredient.create!(
  recipe: recipe_6,
  ingredient: sesame_seeds,
  amount: "to taste",
  measurement_type: ""
)
RecipeIngredient.create!(
  recipe: recipe_6,
  ingredient: spring_onion,
  amount: "to taste",
  measurement_type: ""
)


recipe_7 = Recipe.create!(
  title: "Paella",
  description: "A classic Spanish rice dish cooked with saffron, seafood, and vegetables.",
  cuisine: "Spanish",
  vegetarian: false,
  vegan: false,
  gluten_free: true,
  dairy_free: true,
  egg_free: true,
  nut_free: true,
  prep_time: 20,
  cook_time: 40,
  level: "Medium",
  servings: 4,
  method: "STEP 1\n
  Heat olive oil in a paella pan over medium heat.\n

  STEP 2\n
  Fry chopped onions, garlic, bell peppers, and diced tomatoes until softened.\n

  STEP 3\n
  Add short-grain rice and stir to coat in the oil.\n

  STEP 4\n
  Stir in saffron threads and hot vegetable stock. Bring to a boil, then reduce heat and simmer until rice is almost cooked.\n

  STEP 5\n
  Nestle seafood (such as prawns, mussels, and squid) into the rice mixture.\n

  STEP 6\n
  Continue to cook until the seafood is cooked through and the rice is tender.\n

  STEP 7\n
  Garnish with chopped parsley and lemon wedges before serving.",
  image: "",
  image_url: "https://i0.wp.com/maicookbook.com/wp-content/uploads/2021/05/maicookbook_seafood_paella_2.jpg?fit=2000%2C2500&ssl=1",
  user: user_2
)

RecipeIngredient.create!(
  recipe: recipe_7,
  ingredient: oil_olive,
  amount: 2,
  measurement_type: "tbsp"
)
RecipeIngredient.create!(
  recipe: recipe_7,
  ingredient: onion,
  amount: 1,
  measurement_type: ""
)
RecipeIngredient.create!(
  recipe: recipe_7,
  ingredient: garlic,
  amount: 2,
  measurement_type: "cloves"
)
RecipeIngredient.create!(
  recipe: recipe_7,
  ingredient: red_pepper,
  amount: 1,
  measurement_type: ""
)
RecipeIngredient.create!(
  recipe: recipe_7,
  ingredient: tomato,
  amount: 2,
  measurement_type: ""
)
RecipeIngredient.create!(
  recipe: recipe_7,
  ingredient: rice_short_grain,
  amount: 300,
  measurement_type: "g"
)
RecipeIngredient.create!(
  recipe: recipe_7,
  ingredient: saffron,
  amount: "pinch",
  measurement_type: ""
)
RecipeIngredient.create!(
  recipe: recipe_7,
  ingredient: stock_vegetable,
  amount: 600,
  measurement_type: "ml"
)
RecipeIngredient.create!(
  recipe: recipe_7,
  ingredient: prawns,
  amount: 200,
  measurement_type: "g"
)
RecipeIngredient.create!(
  recipe: recipe_7,
  ingredient: mussels,
  amount: 200,
  measurement_type: "g"
)
RecipeIngredient.create!(
  recipe: recipe_7,
  ingredient: squid,
  amount: 200,
  measurement_type: "g"
)
RecipeIngredient.create!(
  recipe: recipe_7,
  ingredient: parsley,
  amount: "to taste",
  measurement_type: ""
)
RecipeIngredient.create!(
  recipe: recipe_7,
  ingredient: lemon_wedge,
  amount: "to taste",
  measurement_type: ""
)


recipe_8 = Recipe.create!(
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
  level: "Easy",
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
  image_url: "https://images.immediate.co.uk/production/volatile/sites/30/2020/08/recipe-image-legacy-id-1001491_11-2e0fa5c.jpg?quality=90&resize=440,400",
  user: user_1
)
RecipeIngredient.create!(
  recipe: recipe_8,
  ingredient: spaghetti,
  amount: 200,
  measurement_type: "g"
)
RecipeIngredient.create!(
  recipe: recipe_8,
  ingredient: bacon,
  amount: 100,
  measurement_type: "g"
)
RecipeIngredient.create!(
  recipe: recipe_8,
  ingredient: garlic,
  amount: 2,
  measurement_type: "cloves"
)
RecipeIngredient.create!(
  recipe: recipe_8,
  ingredient: egg,
  amount: 2,
  measurement_type: ""
)
RecipeIngredient.create!(
  recipe: recipe_8,
  ingredient: cheese_parmesan,
  amount: 50,
  measurement_type: "g"
)
RecipeIngredient.create!(
  recipe: recipe_8,
  ingredient: black_pepper,
  amount: 1,
  measurement_type: "tsp"
)


recipe_9 = Recipe.create!(
  title: "Thai Green Curry",
  description: "A fragrant and spicy Thai curry made with green curry paste, coconut milk, and a variety of vegetables and protein.",
  cuisine: "Thai",
  vegetarian: false,
  vegan: true,
  gluten_free: true,
  dairy_free: true,
  egg_free: true,
  nut_free: false,
  prep_time: 20,
  cook_time: 25,
  level: "Medium",
  servings: 4,
  method: "STEP 1\n
  Heat oil in a large pot or saucepan over medium heat.\n

  STEP 2\n
  Add sliced onions, chopped garlic, and diced chicken, tofu, or vegetables of your choice. Cook until browned.\n

  STEP 3\n
  Stir in green curry paste and cook for 1-2 minutes until fragrant.\n

  STEP 4\n
  Pour in coconut milk and vegetable broth. Bring to a simmer.\n

  STEP 5\n
  Add chopped carrots, bell peppers, and bamboo shoots. Simmer for 10-15 minutes until vegetables are tender.\n

  STEP 6\n
  Stir in chopped basil leaves and lime juice.\n

  STEP 7\n
  Serve hot with steamed rice.",
  image: "",
  image_url: "https://hot-thai-kitchen.com/wp-content/uploads/2022/09/vegan-green-curry-sq-1.jpg",
  user: user_2
)
RecipeIngredient.create!(
  recipe: recipe_9,
  ingredient: oil_vegetable,
  amount: 2,
  measurement_type: "tbsp"
)
RecipeIngredient.create!(
  recipe: recipe_9,
  ingredient: onion,
  amount: 1,
  measurement_type: ""
)
RecipeIngredient.create!(
  recipe: recipe_9,
  ingredient: garlic,
  amount: 2,
  measurement_type: "cloves"
)
RecipeIngredient.create!(
  recipe: recipe_9,
  ingredient: chicken,
  amount: 400,
  measurement_type: "g"
)
RecipeIngredient.create!(
  recipe: recipe_9,
  ingredient: tofu,
  amount: 300,
  measurement_type: "g"
)
RecipeIngredient.create!(
  recipe: recipe_9,
  ingredient: green_curry_paste,
  amount: 2,
  measurement_type: "tbsp"
)
RecipeIngredient.create!(
  recipe: recipe_9,
  ingredient: coconut_milk,
  amount: 400,
  measurement_type: "ml"
)
RecipeIngredient.create!(
  recipe: recipe_9,
  ingredient: stock_vegetable,
  amount: 250,
  measurement_type: "ml"
)
RecipeIngredient.create!(
  recipe: recipe_9,
  ingredient: carrot,
  amount: 2,
  measurement_type: ""
)
RecipeIngredient.create!(
  recipe: recipe_9,
  ingredient: red_pepper,
  amount: 1,
  measurement_type: ""
)
RecipeIngredient.create!(
  recipe: recipe_9,
  ingredient: bamboo_shoots,
  amount: 100,
  measurement_type: "g"
)
RecipeIngredient.create!(
  recipe: recipe_9,
  ingredient: basil,
  amount: "to taste",
  measurement_type: ""
)
RecipeIngredient.create!(
  recipe: recipe_9,
  ingredient: lime_juice,
  amount: 2,
  measurement_type: "tbsp"
)



foodbank_1 = Foodbank.create!(:name => "The Trussell Trust", :address => "150 Camden Road, London, NW1", telephone: "020 7267 1900")
foodbank_2 = Foodbank.create!(:name => "The Romulo Treasure Trove", :address => "200 Green Lanes, London, N16", telephone: "020 707 1950")
foodbank_3 = Foodbank.create!(:name => "Grace Giving Inn", :address => "150 Brixton Road, London, SW5", telephone: "020 7558 2000")
foodbank_4 = Foodbank.create!(:name => "Toren's Treat", :address => "150 Kingsland Road, London, N1", telephone: "020 7222 1885")
foodbank_5 = Foodbank.create!(:name => "Big Poppa's Food Fountain", :address => "150 Harrow Road, London, NW10", telephone: "020 7485 5000")
foodbank_6 = Foodbank.create!(:name => "Food Bank For All", :address => "150 Southgate Road, London, NW1", telephone: "020 7707 8700")
foodbank_8 = Foodbank.create!(:name => "Food For All", :address => "45 Old Street, London, EC1", telephone: "020 7967 5252")
foodbank_9 = Foodbank.create!(:name => "No Hunger", :address => "Kilburn High Road, London, NW6", telephone: "020 7857 8800")
foodbank_10 = Foodbank.create!(:name => "Bigger Hearts", :address => "89 Mare Street, London, E8", telephone: "020 7887 0000")





# recipe = Recipe.create!(
#   title: ,
#   description: ,
#   cuisine: ,
#   vegetarian: true,
#   vegan: true,
#   gluten_free: true,
#   dairy_free: true,
#   egg_free: true,
#   nut_free: true,
#   prep_time: ,
#   cook_time: ,
#   level: ,
#   servings: ,
#   method: ,
#   image:
# )
# recipe_ingredient = RecipeIngredient.create!(
#   recipe: ,
#   ingredient: ,
#   amount:
# )

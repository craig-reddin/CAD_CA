require "test_helper"

class RecipeTest < ActiveSupport::TestCase
   test "should save a recipe" do
   recipe = Recipe.new(
    recipe_name: "Spagetti",
    meal_type: "dinner",
    ingredients:"Pasta, beef, tomatoes",
    instructions: "Cook it",
    source: "me",
    preperation_time: 5, 
    cooking_time: 5)

   assert recipe.save
  end

  test "should not save a recipe empty meal type" do
   recipe = Recipe.new(
    recipe_name: "Spagetti",
    meal_type: "",
    ingredients:"Pasta, beef, tomatoes",
    instructions: "Cook it",
    source: "me",
    preperation_time: 5, 
    cooking_time: 5)

   assert_not recipe.save
  end

  test "should not save a recipe empty ingredients" do
   recipe = Recipe.new(
    recipe_name: "Spagetti",
    meal_type: "dinner",
    ingredients:"",
    instructions: "Cook it",
    source: "me",
    preperation_time: 5, 
    cooking_time: 5)

   assert_not recipe.save
  end

  test "should not save a recipe empty instructions" do
   recipe = Recipe.new(
    recipe_name: "Spagetti",
    meal_type: "dinner",
    ingredients:"Pasta, beef, tomatoes",
    instructions: "",
    source: "me",
    preperation_time: 5, 
    cooking_time: 5)

   assert_not recipe.save
  end

  test "should not save a recipe empty source" do
   recipe = Recipe.new(
    recipe_name: "Spagetti",
    meal_type: "dinner",
    ingredients:"Pasta, beef, tomatoes",
    instructions: "Cook it",
    source: "",
    preperation_time: 5, 
    cooking_time: 5)

   assert_not recipe.save
  end

  test "should not save a recipe less than one preperation time" do
   recipe = Recipe.new(
    recipe_name: "Spagetti",
    meal_type: "dinner",
    ingredients:"Pasta, beef, tomatoes",
    instructions: "Cook it",
    source: "me",
    preperation_time: 0, 
    cooking_time: 5)

   assert_not recipe.save
  end

  test "should not save a recipe less than one cooking time" do
   recipe = Recipe.new(
    recipe_name: "Spagetti",
    meal_type: "dinner",
    ingredients:"Pasta, beef, tomatoes",
    instructions: "Cook it",
    source: "me",
    preperation_time: 5, 
    cooking_time: 0 )

   assert_not recipe.save
  end

  test "should delete a recipe" do
   @recipe = recipes(:one)
   @num1 = Recipe.count

   @recipe.destroy
   @num2 = Recipe.count

   assert_not_equal @num1, @num2
  end
end

class RecipeIngredientsController < ApplicationController

  def new
    @recipe_ingredient = RecipeIngredient.new
    @recipe = Recipe.find(params[:recipe_id])
  end

  def recipe_ingredient_list
    @recipe = Recipe.find(params[:recipe_id])
    @recipe_ingredients = @recipe.recipe_ingredients
    render "recipe_ingredients/recipe_ingredient_list", recipe: @recipe, recipe_ingredients: @recipe_ingredients, status: :ok
  end

  def create

    @recipe = Recipe.find(params[:recipe_id])
    @recipe_ingredient = RecipeIngredient.new(recipe_ingredient_params)
    @recipe_ingredient.recipe = @recipe
    render "recipes/edit", recipe: @recipe, status: :unprocessable_entity unless @recipe_ingredient.save
  end

  def recipe_ingredient_params
    params.require(:recipe_ingredient).permit(:ingredient_id, :amount, :measurement_type)
  end
end

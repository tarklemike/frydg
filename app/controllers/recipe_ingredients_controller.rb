class RecipeIngredientsController < ApplicationController

  def new
    @recipe_ingredient = RecipeIngredient.new
  end

  def create
    @recipe_ingredient = RecipeIngredient.new(recipe_ingredient_params)
    @recipe_ingredient.save
    redirect_to recipe_path(@recipe_ingredient.recipe)
  end

  def recipe_ingredient_params
    params.require(:recipe_ingredient).permit(:recipe_id, :ingredient_id, :amount)
  end
end

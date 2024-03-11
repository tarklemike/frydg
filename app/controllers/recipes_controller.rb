class RecipesController < ApplicationController

  def index
    @recipes = Recipe.all
    @recipe_ingredients = RecipeIngredient.all
    if params[:query].present?
      @recipes = @recipes.searching(params[:query])
    end
    @recipes = @recipes.order(updated_at: :desc)
  end

  def show
    @recipe = Recipe.find(params[:id])
    @review = Review.new
    @recipe_ingredient = RecipeIngredient.new
  end

  def new
    @recipe = Recipe.new
    @recipe.recipe_ingredients.build
    # 10.times {@recipe.recipe_ingredients.build}
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.user = current_user
    if @recipe.save!
      redirect_to recipe_path(@recipe), notice: "Recipe was successfully created"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @recipe = Recipe.find(params[:id])

    @recipe_ingredient = RecipeIngredient.new
    # @ingredients = Ingredient.all

  end

  def update
    @recipe = Recipe.find(params[:id])
    if @recipe.update(recipe_params)
      redirect_to recipe_path(@recipe), notice: "Recipe was successfully updated"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    redirect_to recipes_path, notice: "Recipe was successfully deleted"
  end

  def add_favorite
    @recipe = Recipe.find(params[:id])
    current_user.favorite(@recipe)
    redirect_to recipe_path(@recipe)
  end

  def remove_favorite
    @recipe = Recipe.find(params[:id])
    current_user.unfavorite(@recipe)
    redirect_to recipe_path(@recipe)
  end

  private

  def recipe_params
    params.require(:recipe).permit(:title, :photo, :description, :method, :prep_time, :cook_time, :servings, :cuisine, recipe_ingredients_attributes: [:ingredient_id])
  end


end

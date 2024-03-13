class RecipesController < ApplicationController

  def index
    @recipes = Recipe.all
    @recipes = @recipes.order(updated_at: :desc)
    @recipe_ingredients = RecipeIngredient.all

    if params[:query].present?
      if params[:query] != 'true'
        @recipes = @recipes.searching(params[:query])
        @recipes = @recipes.order(updated_at: :desc)
      end

      if params[:gluten_free] == 'true'
        @recipes = @recipes.select { |recipe| recipe.gluten_free == true }
      end

      if params[:dairy_free] == 'true'
        @recipes = @recipes.select { |recipe| recipe.dairy_free == true }
      end

      if params[:nut_free] == 'true'
        @recipes = @recipes.select { |recipe| recipe.nut_free == true }
      end

      if params[:egg_free] == 'true'
        @recipes = @recipes.select { |recipe| recipe.egg_free == true }
      end

      if params[:vegetarian] == 'true'
        @recipes = @recipes.select { |recipe| recipe.vegetarian == true }
      end

      if params[:vegan] == 'true'
        @recipes = @recipes.select { |recipe| recipe.vegan == true }
      end


      if params[:easy] == 'true'
        @recipes = @recipes.select { |recipe| recipe.level == "easy" }
      end
      if params[:medium] == 'true'
        @recipes = @recipes.select { |recipe| recipe.level == "medium" }
      end
      if params[:hard] == 'true'
        @recipes = @recipes.select { |recipe| recipe.level == "hard" }
      end


      if params[:british] == 'true'
        @recipes = @recipes.select { |recipe| recipe.cuisine == "british" }
      end
      if params[:chinese] == 'true'
        @recipes = @recipes.select { |recipe| recipe.cuisine == "chinese" }
      end
      if params[:french] == 'true'
        @recipes = @recipes.select { |recipe| recipe.cuisine == "french" }
      end
      if params[:indian] == 'true'
        @recipes = @recipes.select { |recipe| recipe.cuisine == "indian" }
      end
      if params[:italian] == 'true'
        @recipes = @recipes.select { |recipe| recipe.cuisine == "italian" }
      end
      if params[:japanese] == 'true'
        @recipes = @recipes.select { |recipe| recipe.cuisine == "japanese" }
      end
      if params[:mexican] == 'true'
        @recipes = @recipes.select { |recipe| recipe.cuisine == "mexican" }
      end
      if params[:spanish] == 'true'
        @recipes = @recipes.select { |recipe| recipe.cuisine == "spanish" }
      end
      if params[:thai] == 'true'
        @recipes = @recipes.select { |recipe| recipe.cuisine == "thai" }
      end


    end


    respond_to do |format|
      format.html
      format.text { render partial: "shared/cardrecipe", locals: { recipes: @recipes }, formats: [:html]}
    end
  end

  def show
    @recipes = Recipe.all
    @recipe = Recipe.find(params[:id])
    @review = Review.new
    @recipe_ingredient = RecipeIngredient.new
  end

  def new
    @recipe = Recipe.new
    # @recipe.recipe_ingredients.build
    @recipe_ingredients = @recipe.recipe_ingredients.build
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
    params.require(:recipe).permit(:title, :photo, :description, :method, :prep_time, :cook_time, :servings, :cuisine, :level, :vegetarian, :vegan, :dairy_free, :nut_free, :gluten_free, :egg_free, recipe_ingredients_attributes: [:id, :amount, :measurement_type, :ingredient_name])
  end
end

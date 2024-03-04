class IngredientsController < ApplicationController

  def new
    @ingredient = Ingredient.new
  end

  def create
    @ingredient = Ingredient.new(ingredient_params)
    if @ingredient.save
      redirect_to new_recipe_path, notice: "Ingredient was added"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
    def ingredient_params
      params.require(:ingredient).permit(:name)
    end
end

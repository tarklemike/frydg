class RecipesController < ApplicationController
  def show
    @recipe = Recipe.find(params[:id])
    @review = Review.new
  end
end

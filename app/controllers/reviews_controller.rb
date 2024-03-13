class ReviewsController < ApplicationController

  def new
    @recipe = Recipe.find(params[:recipe_id])
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @recipe = Recipe.find(params[:recipe_id])
    @review.recipe = @recipe
    @review.user = current_user

    respond_to do |format|
      if @review.save!
        format.html {redirect_to recipe_path(@recipe)}
        format.json
      else
        format.html {render "recipes/show", status: :unprocessable_entity}
        format.json
      end
    end


  end

  private

  def review_params
    params.require(:review).permit(:comment, :rating)
  end
end

class ReviewsController < ApplicationController


  def index

  end

  def show

  end

  def new

    @recipe = Recipe.find(params[:recipe_id])
    @review = Review.new

  end

  def create


  end

  def edit

  end

  def update

  end

  def destroy

  end
end

class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @recipes = Recipe.all
    if params[:query].present?
      @recipes = @recipes.searching(params[:query])
    end
    @recipes = @recipes.order(created_at: :desc)
  end
end

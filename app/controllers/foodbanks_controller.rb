class FoodbanksController < ApplicationController

  def index
    @foodbanks = Foodbank.all
    @markers = @foodbanks.geocoded.map do |foodbank|
      {
        lat: foodbank.latitude,
        lng: foodbank.longitude
      }
    end
  end

  def show
    @foodbank = Foodbank.find(params[:id])
    @foodbank = Foodbank.new
  end

  def new
    @foodbank = Foodbank.new
  end

  def create
    @foodbank = Foodbank.new(foodbank_params)
    if @foodbank.save!
      redirect_to foodbank_path(@foodbank), notice: "Foodbank was successfully created"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @foodbank = Foodbank.find(params[:id])
  end

  def update
    @foodbank = Foodbank.find(params[:id])
    if @foodbank.update(foodbank_params)
      redirect_to foodbank_path(@foodbank), notice: "Foodbank was successfully updated"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @foodbank = Foodbank.find(params[:id])
    @foodbank.destroy
    redirect_to foodbanks_path, notice: "Foodbank was successfully deleted"
  end

  private

  def foodbank_params
  params.require(:foodbank).permit(:latitude, :longitude, :name, :address)
  end

end

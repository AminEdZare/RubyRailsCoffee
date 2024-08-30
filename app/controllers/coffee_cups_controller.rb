class CoffeeCupsController < ApplicationController
  http_basic_authenticate_with name: ENV['USERNAME'], password: ENV['SECRET_PASS'], except: [:index, :show]

  def index
    @coffee_cups = CoffeeCup.all.order(created_at: :desc)
  end

  def show
    @coffee_cup = CoffeeCup.find(params[:id])
  end

  def new
    @coffee_cup = CoffeeCup.new
  end

  def create
    @coffee_cup = CoffeeCup.create!(coffee_cup_params)
    if @coffee_cup.save
      redirect_to @coffee_cup
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @coffee_cup = CoffeeCup.find(params[:id])
  end

  def update
    @coffee_cup = CoffeeCup.find(params[:id])

    if @coffee_cup.update(coffee_cup_params)
      redirect_to @coffee_cup
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @coffee_cup = CoffeeCup.find(params[:id])
    @coffee_cup.destroy

    redirect_to root_path, status: :see_other
  end

  private
    def coffee_cup_params
      params.require(:coffee_cup).permit(:title, :body, :coffee_cup, :status)
    end

end

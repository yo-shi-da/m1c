class FoodsController < ApplicationController
  before_action :set_food, only: %i[show edit update destroy]

  def index
    @q = Food.all.ransack(params[:q])
    @foods = @q.result
  end

  def new
    @food = Food.new
  end

  def show
  end

  def edit
  end

  def create
    @food = Food.new(food_params)
    if @food.save
      redirect_to @food, notice: '作成しました。'
    else
      render :new
    end
  end

  def update
    if @food.update(food_params)
      redirect_to @food, notice: '編集しました。'
    else
      render :edit
    end
  end

  def destroy
    @food.destroy
    redirect_to foods_url, notice: '削除しました。'
  end

  private
    def set_food
      @food = Food.find(params[:id])
    end

    def food_params
      params.require(:food).permit(:classification, :food_name, :food_amount, :sugar_amount)
    end
end

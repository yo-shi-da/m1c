class FoodsController < ApplicationController
  before_action :set_food, only: [:show, :edit, :update, :destroy]

  # GET /foods
  def index
    @foods = Food.all
  end

  # GET /foods/new
  def new
    @food = Food.new
  end

  def show
  end

  # GET /foods/1/edit
  def edit
  end

  # POST /foods
  def create
    @food = Food.new(food_params)

    if @food.save
      redirect_to @food, notice: '作成しました。'
    else
      render :new
    end
  end

  # PATCH/PUT /foods/1
  def update
    if @food.update(food_params)
      redirect_to @food, notice: '編集しました。'
    else
      render :edit
    end
  end

  # DELETE /foods/1
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

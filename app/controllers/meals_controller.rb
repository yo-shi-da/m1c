class MealsController < ApplicationController
  before_action :set_meal, only: [:edit, :update, :destroy]
  before_action :authenticate_user! #追加

  # GET /meals
  def index
    @meals = Meal.all
  end

  # GET /meals/1
  def show
  end

  # GET /meals/new
  def new
    @meal = Meal.new
  end

  # GET /meals/1/edit
  def edit
  end

  # POST /meals
  def create
    @meal = current_user.meals.new(meal_params)

    if @meal.save
      redirect_to @meal, notice: 'Meal was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /meals/1
  def update
    if @meal.update(meal_params)
      redirect_to @meal, notice: 'Meal was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /meals/1
  def destroy
    @meal.destroy
    redirect_to meals_url, notice: 'Meal was successfully destroyed.'
  end

  def read_changes
    @meal = Meal.find(params[:id])
    if @meal.read_change == false
      @meal.update(read_change: 'ture')
      @meal.save
      redirect_to meal_path(id: @meal.id), notice: "既読になりました。"
    else
      @meal.update(read_change: 'false')
      @meal.save
      redirect_to meal_path(id: @meal.id), notice: "未読になりました。"
    end
  end


  def calendar
    @meals = current_user.meals
  end
  
  def graph
    @meals = current_user.meals
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_meal
      @meal = current_user.meals.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def meal_params
      params.require(:meal).permit(:sugar_amount, :sugar_cube, :classification, :image, :start_time, :reading_checks, :remarks, :user_id)
    end
end

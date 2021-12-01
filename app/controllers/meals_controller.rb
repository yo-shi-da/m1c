class MealsController < ApplicationController
  before_action :set_meal, only: [:edit, :update, :destroy]

  def index
    if params[:id].present?
      @user = User.find(params[:id]) 
      @q = @user.meals.ransack(params[:q])
    else
      @q = current_user.meals.ransack(params[:q])
    end    
    @meals = @q.result.page(params[:page])
  end

  def export_csv
    @user = User.find(params[:id]) 
    @meals = @user.meals
    respond_to do |format|
      format.csv { send_data @meals.generate_csv, filename: "meals-#{Time.zone.now.strftime('%Y%m%d%S')}.csv" }
    end
  end

  def show
    @meal = Meal.find(params[:id])
    @post = @meal.post
  end

  def new
    @meal = Meal.new
  end

  def edit
  end

  def create
    @meal = current_user.meals.new(meal_params)
    if @meal.save
      redirect_to @meal, notice: '作成しました。'
    else
      render :new
    end
  end

  def update
    if @meal.update(meal_params)
      redirect_to @meal, notice: '更新しました。'
    else
      render :edit
    end
  end

  def destroy
    @meal.destroy
    redirect_to meals_url, notice: '削除しました。'
  end

  def read_changes
    @meal = Meal.find(params[:id])
    if @meal.reading_checks == false
      @meal.update(reading_checks: 'true')
    end
    redirect_to meals_url(id: @meal.user_id), notice: '既読になりました。'
  end
  
  def calendar
    @meals = current_user.meals
  end
  
  def graph
    @meals = current_user.meals
  end

  private
    def set_meal
      @meal = current_user.meals.find(params[:id])
    end

    def meal_params
      params.require(:meal).permit(:sugar_amount, :sugar_cube, :classification, :image, :start_time, :reading_checks, :remarks, :image_cache )
    end
end

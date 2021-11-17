class MealsController < ApplicationController
  before_action :set_meal, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /meals
  def index
    # グループオーナー、カレントユーザーが見る時で、表示を変える。
    if params[:id].present?
    # if params[:user_id].present?
      @user = User.find(params[:id]) 
      @q = @user.meals.ransack(params[:q])
      @meals = @q.result.page(params[:page])

      # csv
      respond_to do |format|
        format.html
        format.csv { send_data @meals.generate_csv, filename: "tasks-#{Time.zone.now.strftime('%Y%m%d%S')}.csv" }
      end
      
    else
      @q = current_user.meals.ransack(params[:q])
      @meals = @q.result.page(params[:page])
    end
    
    # 参加しているグループ取得
    @group_users_middle = Member.find_by(user_id: current_user.id)  
    @current_user_group = @group_users_middle.group if @group_users_middle.present?  # current_userが参加しているグループ
    # binding.pry

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
      params.require(:meal).permit(:sugar_amount, :sugar_cube, :classification, :image, :start_time, :reading_checks, :remarks, :user_id, :image_cache )
    end
end

class PersonalsController < ApplicationController
  before_action :set_personal, only: [:destroy]
  before_action :current_user_personal, only: [:show, :edit]

  def show
    if current_user.id == @user.id || current_user.id == my_group&.owner_id
      @user_personal = @user.personal
    else
      redirect_to meals_path, notice: "他のユーザーをみることはできません。"
    end
  end

  def new
    @personal = Personal.new
  end

  def edit
    @user_personal = @user.personal
  end

  def create
    @personal = Personal.new(personal_params.merge(user_id: current_user.id))
    if @personal.save
      redirect_to personal_path(current_user.id), notice: '作成しました。'
    else
      render :new
    end
  end

  def update
    @personal = Personal.find(params[:id])
    if @personal.update(personal_params)
      redirect_to personal_path(current_user.id), notice: '更新しました。'
    else
      render :edit
    end
  end

  def destroy
    @personal.destroy
    redirect_to personals_url, notice: '削除しました。'
  end

  private

    def current_user_personal
      @user = User.find(params[:id])
    end

    def set_personal
      @personal = current_user.personals.find(params[:id])
    end

    def personal_params
      params.require(:personal).permit(:birth_date, :height, :body_weight, :gender, :bmi, :waist_circumference, :hba_onec, :underlying_disease, :intake_per_oneday, :remarks, :user_id)
    end
end

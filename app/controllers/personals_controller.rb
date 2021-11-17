class PersonalsController < ApplicationController
  before_action :set_personal, only: [:show, :edit, :update, :destroy]

  # GET /personals
  def index
    @personals = Personal.all
  end

  # GET /personals/1
  def show
  end

  # GET /personals/new
  def new
    @personal = Personal.new
  end

  # GET /personals/1/edit
  def edit
  end

  # POST /personals
  def create
    @personal = Personal.new(personal_params)

    if @personal.save
      redirect_to @personal, notice: 'Personal was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /personals/1
  def update
    if @personal.update(personal_params)
      redirect_to @personal, notice: 'Personal was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /personals/1
  def destroy
    @personal.destroy
    redirect_to personals_url, notice: 'Personal was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_personal
      @personal = Personal.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def personal_params
      params.require(:personal).permit(:birth_date, :height, :body_weight, :gender, :bmi, :waist_circumference, :hba_onec, :underlying_disease, :intake_per_oneday, :remarks, :user_id)
    end
end

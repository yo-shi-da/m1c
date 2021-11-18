class PersonalsController < ApplicationController
  before_action :set_personal, only: [:destroy]
  before_action :authenticate_user! #追加

  # GET /personals/1
  def show

    @user = User.find(params[:id])
    @user_personal = @user.personal #　Personals一覧を配列で取得(has_oneならば、配列ではない。)
    # @users_personal_id = @users_personal.first # 一番目を取得（has_oneの場合、このコードが不要。）

    # if @users_personal_id != nil
    #   @personal = Personal.find_by(id: @users_personal.id) #同じ名前が続くのは避ける。
    # end

  end

  # GET /personals/new
  def new
    @personal = Personal.new
  end

  # GET /personals/1/edit
  def edit
    @user = User.find(params[:id])
    @user_personal = @user.personal #　Personals一覧を配列で取得(has_oneならば、配列ではない。)
    # @users_personal_id = @users_personal.first # 一番目を取得（has_oneの場合、このコードが不要。）

    # if @users_personal_id != nil
    #   @personal = Personal.find_by(id: @users_personal_id.id) #同じ名前が続くのは避ける。
    # end
  end

  # POST /personals
  def create
    # @personal = current_user.personal.new(personal_params)
    @personal = Personal.new(personal_params)
    @personal.user_id = current_user.id

    if @personal.save
      redirect_to @personal, notice: 'Personal was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /personals/1
  def update
    @personal = Personal.find(params[:id])
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
      @personal = current_user.personals.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def personal_params
      params.require(:personal).permit(:birth_date, :height, :body_weight, :gender, :bmi, :waist_circumference, :hba_onec, :underlying_disease, :intake_per_oneday, :remarks, :user_id)
    end
end

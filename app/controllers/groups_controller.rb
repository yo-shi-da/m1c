class GroupsController < ApplicationController
  before_action :set_group, only: [:show, :update, :destroy]
  before_action :authenticate_user!

  # GET /groups
  def index
    @groups = Group.all

    # current_userが参加しているグループ
    @current_user_group = current_user.joined_group.first if current_user.joined_group.length != 0
    @group_user = Member.find_by(user_id: current_user.id) # 削除に必要。

  end

  # GET /groups/new
  def new
    @group = Group.new
  end

  # GET /groups/1/edit
  def edit
    @group = my_group
  end

  # POST /groups
  def create
    @group = Group.new(group_params)
    @group.owner_id = current_user.id # オーナー設定

    if @group.save
      Member.create(group_id: @group.id, user_id: current_user.id) # 作成者もグループに参加する。
      redirect_to groups_path, notice: 'Group was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /groups/1
  def update
    if @group.update(group_params)
      redirect_to groups_path, notice: 'Group was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /groups/1
  def destroy
    @group.destroy
    redirect_to groups_path, notice: 'Group was successfully destroyed.'
  end

  def member_all
    @group = my_group
    @group_members = @group.users # 参加者一覧
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_group
      @group = Group.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def group_params
      params.require(:group).permit(:name, :owner_id)
    end
end

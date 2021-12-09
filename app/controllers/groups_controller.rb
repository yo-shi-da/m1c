class GroupsController < ApplicationController
  before_action :set_group, only: %i[show update destroy]

  def index
    @groups = Group.all
    @current_user_group = my_group
    @group_user = Member.find_by(user_id: current_user.id)
  end

  def new
    @group = Group.new
  end

  def edit
    @group = my_group
  end

  def create
    @group = Group.new(group_params)
    @group.owner_id = current_user.id 
    if @group.save
      Member.create(group_id: @group.id, user_id: current_user.id) 
      redirect_to groups_path, notice: '作成しました。'
    else
      render :new
    end
  end

  def update
    if @group.update(group_params)
      redirect_to groups_path, notice: '更新しました。'
    else
      render :edit
    end
  end

  def destroy
    @group.destroy
    redirect_to groups_path, notice: '削除しました。'
  end

  def member_all
    @group_members = my_group.users
  end

  private
    def set_group
      @group = Group.find(params[:id])
    end

    def group_params
      params.require(:group).permit(:name, :owner_id)
    end
end

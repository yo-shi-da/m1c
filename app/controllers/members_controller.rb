class MembersController < ApplicationController
  before_action :authenticate_user!

  def create
    current_user.members.create(group_id: params[:group_id])
    redirect_to groups_path, notice: "参加しました"
  end

  def destroy
    current_user.members.find_by(id: params[:id]).destroy
    redirect_to groups_path, notice: "参加解除しました"
  end
  
end

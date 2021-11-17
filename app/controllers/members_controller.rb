class MembersController < ApplicationController

  def create
    current_user.memberses.create(group_id: params[:group_id])
    redirect_to groups_path, notice: "参加しました"
  end

  def destroy
    current_user.memberses.find_by(id: params[:id]).destroy
    redirect_to groups_path, notice: "参加解除しました"
  end

end

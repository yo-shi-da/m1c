module GroupsHelper

  def group_participation_helper(group)
    # binding.pry
    if current_user.id == group.owner_id
      p 'あなたは、この会社の管理者です。'
    else
      if my_group != nil
        if group == my_group
          link_to "解除", member_path(id: @group_user.id), method: :delete, class:"btn btn-outline-danger"
        else
          p '他会社に参加中の為、参加できません。'
        end
      else
        link_to '参加する', members_path(group_id: group.id), method: :post, class:"btn btn-outline-danger"
      end
    end
  end

end
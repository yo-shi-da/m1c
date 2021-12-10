module GroupsHelper

  def group_participation_helper(group)
    # binding.pry
    if current_user.id == group.owner_id
      # p 'a'
      p 'あなたは、この病院の管理者です。'
    else
      if my_group != nil
        if group == my_group
          link_to "解除", member_path(id: @group_user.id), method: :delete, class:"btn btn-outline-danger"
          # p 'b'
        else
          p '他病院に参加中の為、参加できません。'
          # p 'c'
        end
      else
        link_to '参加する', members_path(group_id: group.id), method: :post, class:"btn btn-outline-danger"
        # p 'd'
      end
    end
  end

end

# <% if current_user.id == group.owner_id %>
#   <td><p>あなたは、この会社の管理者です。</p></td>
# <% else %>
#     <% if my_group != nil %>
#       <% if group == my_group %>
#         <td><%= link_to '解除', member_path(id: @group_user.id), method: :delete, class:"btn btn-outline-danger" %></td>
#         <td></td>
#         <td></td>
#       <% else %>
#         <td><p>他会社に参加中の為、参加不可です。</p></td>
#         <td></td>
#         <td></td>
#       <% end %>
#     <% else %>
#       <td><%= link_to '参加する', members_path(group_id: group.id), method: :post, class:"btn btn-outline-danger" %></td>
#         <td></td>
#         <td></td>
#     <% end %>
# <% end %>

module MealsHelper

  def view_user_ownser_check_helper
    # binding.pry
    if my_group&.owner_id == current_user.id && params[:id].to_i == current_user.id
      p ''
    elsif my_group&.owner_id == current_user.id && params[:id].present?
      p 'check'
    elsif my_group&.owner_id != current_user.id
      p 'check'
    else
      p ''
    end
  end

  def view_user_ownser_read_changes_helper(meal)
    # binding.pry
    if my_group&.owner_id == current_user.id && params[:id].to_i == current_user.id
      p ''
    elsif my_group&.owner_id == current_user.id && params[:id].present?
      if meal.reading_checks
        p '既読'
      else
        p '未読'
      end
    elsif my_group&.owner_id != current_user.id
      if meal.reading_checks
        p '既読'
      else
        p '未読'
      end
    else
      p ''
    end      
  end

end

# <% if my_group&.owner_id == current_user.id && params[:id].to_i == current_user.id %><!-- GroupOwnerが参加者ページに遷移し、オーナーだった場合 -->
#   <th></th>
# <% elsif my_group&.owner_id == current_user.id && params[:id].present?  %><!-- GroupOwnerが参加者ページに遷移し、オーナーでない場合 -->
#   <th><%= t('meals.reading_checks') %></th>
# <% elsif my_group&.owner_id != current_user.id %><!-- ログイン後、GroupOwnerでない場合 -->
#   <th><%= t('meals.reading_checks') %></th>
# <% else %><!-- ログイン後、GroupOwner -->
#   <th></th>
# <% end %>


# <% if my_group&.owner_id == current_user.id && params[:id].to_i == current_user.id %><!-- GroupOwnerが参加者ページに遷移し、オーナーだった場合 -->
#   <td></td>
# <% elsif my_group&.owner_id == current_user.id && params[:id].present?  %><!-- GroupOwnerが参加者ページに遷移し、オーナーでない場合 -->
#   <% if meal.reading_checks %>
#     <td>既読</td>
#   <% else %>
#     <td id="meal_r<%= meal.id %>">未読</td>
#   <% end %>
# <% elsif my_group&.owner_id != current_user.id %><!-- ログイン後、GroupOwnerでない場合 -->
#   <% if meal.reading_checks %>
#     <td>既読</td>
#   <% else %>
#     <td>未読</td>
#   <% end %>
# <% else %><!-- ログイン後、GroupOwner -->
#   <td></td>
# <% end %>
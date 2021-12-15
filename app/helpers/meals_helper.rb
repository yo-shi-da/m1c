module MealsHelper

  def view_user_ownser_check_helper
    # binding.pry
    if my_group&.owner_id == current_user.id && params[:id].to_i == current_user.id #<!-- GroupOwnerが参加者ページに遷移し、オーナーだった場合 -->
      p ''
    elsif my_group&.owner_id == current_user.id && params[:id].present? #<!-- GroupOwnerが参加者ページに遷移し、オーナーでない場合 -->
      p 'check'
    elsif my_group&.owner_id != current_user.id #<!-- ログイン後、GroupOwnerでない場合 -->
      p 'check'
    else #<!-- ログイン後、GroupOwner -->
      p ''
    end
  end

  def view_user_ownser_read_changes_helper(meal)
    # binding.pry
    if my_group&.owner_id == current_user.id && params[:id].to_i == current_user.id #<!-- GroupOwnerが参加者ページに遷移し、オーナーだった場合 -->
      p ''
    elsif my_group&.owner_id == current_user.id && params[:id].present? #<!-- GroupOwnerが参加者ページに遷移し、オーナーでない場合 -->
      if meal.reading_checks
        p '既読'
      else
        p '未読'
      end
    elsif my_group&.owner_id != current_user.id #<!-- ログイン後、GroupOwnerでない場合 -->
      if meal.reading_checks
        p '既読'
      else
        p '未読'
      end
    else #<!-- ログイン後、GroupOwner -->
      p ''
    end      
  end

end
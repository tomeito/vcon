module EntryUsersHelper

  def other_side_name(is_mr)
    if is_mr
      "ミス"
    else
      "ミスター"
    end
  end

  def other_side_index(is_mr)
    if is_mr
      "/ms"
    else
      "/mr"
    end
  end

  def other_side_link(is_mr)
    if is_mr
      link_to "ミスの参加者一覧を見る", "/ms", class:"to_ms"
    else
      link_to "ミスターの参加者一覧を見る", "/mr", class:"to_mr"
    end
  end

  def picture_dir_exist?(entry_user)
    File.exist? picture_dir(entry_user)
  end

  private
  def picture_dir(entry_user)
    "#{Rails.root}/app/assets/images/#{entry_user.name.remove("/")}"
  end
end

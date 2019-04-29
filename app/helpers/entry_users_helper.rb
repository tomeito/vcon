module EntryUsersHelper
  def picture_dir_exist?(entry_user)
    File.exist? picture_dir(entry_user)
  end

  private
  def picture_dir(entry_user)
    "#{Rails.root}/app/assets/images/#{entry_user.name.remove("/")}"
  end
end

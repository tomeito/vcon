module SharedHelper
  def ogp_url
    return image_url if @entry_user || @entry_user.id
    redirect_to "/"
  end

  private
  def image_url
    Rails.application.routes.url_helpers.root_url + image_path
  end

  def image_path
    "/img/posted/" + @entry_user.name.remove("/") + ".png"
  end
end

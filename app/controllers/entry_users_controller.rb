class EntryUsersController < ApplicationController

  def index
    puts request.fullpath
    if request.fullpath == "/mr"
      @contest_title = "バーチャルミスターコンテスト"
      @entry_users = EntryUser.where(is_Mr: true)
      @is_Mr = true
    elsif request.fullpath == "/ms"
      @contest_title = "バーチャルミスコンテスト"
      @entry_users = EntryUser.where(is_Mr: false)
      @is_Mr = false
    else
      @contest_title = "バーチャルミス・ミスターコンテスト"
      @entry_users = EntryUser.all
    end
  end

  def show
    @entry_user = EntryUser.find(params[:id])
  end
end

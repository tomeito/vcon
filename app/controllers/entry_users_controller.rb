class EntryUsersController < ApplicationController

  def index
    @entry_users = EntryUser.all
  end

  def show
    @entry_user = EntryUser.find(params[:id])
  end
end

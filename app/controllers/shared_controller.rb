class SharedController < ApplicationController
  def index
    if params[:id] && (@entry_user = EntryUser.find(params[:id]))
      render 'index'
      if @entry_user.is_Mr
        redirect_to "/mr"
      else
        redirect_to "/ms"
      end
    end
    redirect_to "/"
  end
end

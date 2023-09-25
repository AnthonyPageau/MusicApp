class PagesController < ApplicationController
  def home
  end

  def find_user
    user = User.find_by(username: params[:search])
    if user
      redirect_to user_path(user)
    else
      flash[:alert] = "Can't find user with username #{params[:search]}"
      redirect_to root_path
    end
  end
end
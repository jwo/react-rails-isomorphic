class SessionController < ApplicationController
  def new
  end

  def create
    username = params[:username]
    password = params[:password]

    user = User.find_by username: username
    if user.try(:authenticate, password)
      sign_in user
      redirect_to admin_root_path
    else
      flash.now[:alert] = "Nope!"
      render :new
    end
  end
end

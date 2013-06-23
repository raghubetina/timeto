class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by_username(params[:username])

    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to root_url, flash: { success: "Signed in successfully." }
    else
      flash[:error] = "Something went wrong. Please try again."
      render 'new'
    end
  end

  def destroy
    reset_session
    redirect_to root_url, flash: { success: "Signed out successfully."}
  end
end

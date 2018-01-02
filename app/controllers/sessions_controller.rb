class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by(username: params[:username])
    @user.password = params[:password]
    @user.password_confirmation = params[:password]
    @user.save
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      if @user.admin?
        redirect_to admin_dashboard_path
      else
        redirect_to user_path(@user)
      end
    else
      render :new
    end
  end

  def destroy
    session.clear
    flash[:notice] = "You have logged out"
    redirect_to root_path
  end

  private

    def user_params
      params.permit(:username, :password)
    end

end

class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def show
    if current_user.id == params[:id].to_i
      @user = current_user
      @categories = Category.order(:title)
      @images = Image.order(:name)
      @idea = Idea.new
    else
      render file: "/public/404"
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end

end

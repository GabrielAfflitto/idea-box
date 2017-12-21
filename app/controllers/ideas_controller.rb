class IdeasController < ApplicationController

  def index
    @category = Category.find(params[:category_id])
    @ideas = @category.ideas
  end

  # def new
  #   @category = Category.find(params[:category_id])
  #   @categories = Category.order(:title)
  #   @images = Image.order(:name)
  #   @idea = @category.ideas.new()
  # end

  def create
    @user = current_user
    @idea = @user.ideas.new(idea_params)
    # binding.pry
    if @idea.save!
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def show
    @user = current_user
    @idea = @user.ideas.find(params[:id])
  end

  def edit
    @user = current_user
    @idea = @user.ideas.find(params[:id])
  end

  def update
    @user = current_user
    @idea = @user.ideas.find(params[:id])
    @idea.update(idea_params)

    redirect_to user_path(@user)
  end

  def destroy
    @user = User.find(params[:user_id])
    @idea = @user.ideas.find(params[:id])
    @idea.destroy

    redirect_to user_path(@user)
  end

  private

  def idea_params
    params.require(:idea).permit(:description, :category_id, image_ids: [])
  end

end

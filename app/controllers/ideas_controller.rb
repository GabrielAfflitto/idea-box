class IdeasController < ApplicationController

  def index
    @category = Category.find(params[:category_id])
    @ideas = @category.ideas
  end

  def new
    @category = Category.find(params[:category_id])
    @categories = Category.all
    # binding.pry
    @idea = @category.ideas.new()
  end

  def create
    @user = User.find(params[:user_id])
    @idea = @user.ideas.new(idea_params)

    if @idea.save!
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def show
    @category = Category.find(params[:category_id])
    @idea = @category.ideas.find(params[:id])
  end

  def edit
    # @category = Category.find(params[:category_id])
    @user = User.find(params[:user_id])
    @idea = @user.ideas.find(params[:id])
  end

  def update
    # @category = Category.find(params[:category_id])
    @user = User.find(params[:user_id])
    @idea = @user.ideas.find(params[:id])
    @idea.update(idea_params)

    redirect_to user_path(@user)
  end

  private

  def idea_params
    params.require(:idea).permit(:description, :category_id)
  end

end

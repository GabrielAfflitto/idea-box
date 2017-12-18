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
    @category = Category.find(params[:category_id])
    @idea = @category.ideas.new(idea_params)

    if @idea.save!
      redirect_to category_ideas_path(@category)
    else
      render :new
    end
  end

  def show
    @category = Category.find(params[:category_id])
    @idea = @category.ideas.find(params[:id])
  end

  def edit
    @category = Category.find(params[:category_id])
    @idea = Idea.find(params[:id])
  end

  def update
    @category = Category.find(params[:category_id])
    @idea = @category.ideas.find(params[:id])
    @idea.update(idea_params)

    redirect_to category_idea_path(@category, @idea)
  end

  private

  def idea_params
    params.require(:idea).permit(:description, :category_id)
  end

end

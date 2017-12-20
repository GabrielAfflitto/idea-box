class Admin::CategoriesController < Admin::BaseController

  def index
    @user = current_user
    @categories = Category.all
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:notice] = "Category named #{@category.title} created!"
      redirect_to admin_categories_path
    else
      flash[:notice] = "There was an error creating your category, I don't know what it is but fix that shit b"
    end
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy

    redirect_to admin_categories_path
  end

  private

  def category_params
    params.require(:category).permit(:title)
  end

end

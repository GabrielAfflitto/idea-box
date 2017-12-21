class Admin::CategoriesController < Admin::BaseController

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to admin_dashboard_path
    else
      flash[:notice] = "There was an error creating your category"
    end
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy

    redirect_to admin_dashboard_path
  end

  private

  def category_params
    params.require(:category).permit(:title)
  end

end

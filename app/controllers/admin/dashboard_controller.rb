class Admin::DashboardController < Admin::BaseController

  def index
    @user = current_user
    @categories = Category.all
    @category = Category.new
    @images = Image.all
    @image = Image.new
  end

  def show
    @image = Image.find(params[:id])
  end

end

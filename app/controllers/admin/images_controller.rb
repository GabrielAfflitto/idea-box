class Admin::ImagesController < Admin::BaseController

  def create
    @image = Image.new(image_params)
    if @image.save
      redirect_to admin_dashboard_path
    else
      flash[:notice] = "There was an error creating an image"
    end
  end

  def show
    @image = Image.find(params[:id])
  end

  def destroy
    @image = Image.find(params[:id])
    @image.destroy

    redirect_to admin_dashboard_path
  end

  private

  def image_params
    params.require(:image).permit(:name, :url)
  end

end

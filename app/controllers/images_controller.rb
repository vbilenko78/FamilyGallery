class ImagesController < ApplicationController

  def index
    @images = Image.all
  end

  def show
    image
  end

  def new
    @image = gallery.images.build
  def edit
    image
  end

  # POST /images
  def create
    @image = gallery.images.new(image_params)

    if @image.save
      redirect_to @image.gallery, notice: 'Image was successfully created.'
    else
      render :new
    end
  end

  def update
    if image.update(image_params)
      redirect_to @image.gallery, notice: 'Image was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    image.destroy
    redirect_to images_url, notice: 'Image was successfully destroyed.'
  end

private

  def gallery
    @gallery ||= Gallery.find(params[:gallery_id])
  end

  def image
    @image ||= Image.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def image_params
    params.require(:image).permit(:name, :description, :file)
  end
end

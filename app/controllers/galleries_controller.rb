class GalleriesController < ApplicationController
  before_action :authenticate_member!

  # GET /galleries
  # GET /galleries.json
  def index
    @galleries = Gallery.all
  end

  # GET /galleries/1
  # GET /galleries/1.json
  def show
    @gallery = Gallery.find(params[:id])
  end

  # GET /galleries/new
  def new
    @gallery = current_member.galleries.build
  end

  # GET /galleries/1/edit
  def edit
    @gallery = Gallery.find(params[:id])
  end

  # POST /galleries
  def create
    @gallery = current_member.galleries.build(gallery_params)

    if @gallery.save
      redirect_to @gallery, notice: 'Gallery was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /galleries/1
  # PATCH/PUT /galleries/1.json
  def update
    @gallery = Gallery.find(params[:id])
    if @gallery.update(gallery_params)
        redirect_to @gallery, notice: 'Gallery was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /galleries/1
  # DELETE /galleries/1.json
  def destroy
    @gallery = Gallery.find(params[:id])
    @gallery.destroy
      redirect_to galleries_url, notice: 'Gallery was successfully destroyed.'
  end

private

  # Never trust parameters from the scary internet, only allow the white list through.
  def gallery_params
    params.require(:gallery).permit(:name, :owner_id, :owner_type, :description, :avatar)
  end

end

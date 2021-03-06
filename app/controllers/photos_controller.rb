class PhotosController < ApplicationController
  def index
    @photos = Photo.order('created_at')
  end

  def new
    @photo = Photo.new
  end

  def create
    binding.pry
    @photo = Photo.new(photo_params)
    if @photo.save
      flash[:success] = "The photo was added!"
      redirect_to root_path
    else
      render 'new'
    end
  end

  private

  def photo_params
    params.require(:photo).permit(:image, :title)
  end
end

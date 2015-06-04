class ImageController < ApplicationController
  
  def index
    
  end
  
  def create
    @image = Image.create(params[:image])
  end
  
  def new
    @image  = Image.new
    @images = Image.all
  end
  
  def show
    @image = Image.find(params[:id])
  end

end
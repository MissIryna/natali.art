class GalleriesController < ApplicationController
  before_action :authenticate
  def index
    @galleries = Gallery.all
  end

  def show
    @gallery = Gallery.find(params[:id])
  end

  def new
    @gallery = Gallery.new
  end
  
 def create
    @gallery = Gallery.new(gallery_params)
    if @gallery.save
      flash[:notice] = "Successfully created gallery."
      redirect_to @gallery
    else
      render :action => 'new'
    end
  end


  def edit
    @gallery = Gallery.find(params[:id])
  end

  def update
    @gallery = Gallery.find(params[:id])
    if @gallery.update_attributes(params[:gallery])
      flash[:notice] = "Successfully updated gallery."
      redirect_to gallery_url
    else
      render :action => 'edit'
    end
  end

  def destroy
     @gallery = Gallery.find(params[:id])
     @gallery.destroy
     # @gallery.destroy
    flash[:success] = "Successfully destroyed gallery."
    redirect_to galleries_url
  end  
    
  private
  ## Strong Parameters 
  def gallery_params
    params.require(:gallery).permit(:name)
  end
   def authenticate
      authenticate_or_request_with_http_basic do |name, password|
         name == "admin" &&  password == "secret"
      end
    end
end


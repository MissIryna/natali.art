class ArtgalleryController < ApplicationController
  def artgallery
    if params[:id]
      @gallery = Gallery.find(params[:id])
      @paintings = @gallery.paintings
    else
      @paintings = Painting.all      
    end
  end
  

end

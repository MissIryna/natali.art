class Image < ActiveRecord::Base
  mount_uploader :image, ImageUploader 
  before_create :default_name
 
  def default_name
    self.name ||= File.basename(image.filename, '.*').titleize if image
  end
  private
  ## Strong Parameters 
  def image_params
    params.require(:image).permit(:name, :image)
  end
end

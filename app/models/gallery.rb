class Gallery < ActiveRecord::Base
  # attr_accessible :name
  has_many :paintings
    private
  ## Strong Parameters 
  def gallery_params
    params.require(:gallery).permit(:name)
  end
end

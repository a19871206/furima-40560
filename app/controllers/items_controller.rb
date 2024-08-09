class ItemsController < ApplicationController
  def index
  end
  def new
    @item = Item.new
  end 

  def create
   Item.create(item_params)
   redirect_to '/'
  end
  def item_params
    params.require(:item).permit(:name, :description, :region_id,) 
  end
  private
#  def item_params
#    params.require(:item).permit(:name, :image, :text)
#  end
  def message_params
    params.require(:item).permit(:image).merge(user_id: current_user.id)
  end

end
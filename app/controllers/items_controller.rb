class ItemsController < ApplicationController
  private

  def item_params
    params.require(:item).permit(:name, :description, :price, :category_id, :status_id, :cost_id, :prefecture_id, :delivery_id, :image).merge(user_id: current_user.id)
  end
end
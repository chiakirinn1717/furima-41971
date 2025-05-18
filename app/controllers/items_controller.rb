class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]

  def index
    @items = Item.all.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to '/'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  private

  def item_params
    params.require(:item).permit(:image, :title, :description, :item_category_id, :item_condition_id, :delivery_fee_id,
                                 :prefecture_id, :delivery_day_id, :price).merge(user_id: current_user.id)
  end
end

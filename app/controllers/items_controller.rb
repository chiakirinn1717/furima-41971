class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :destroy]
  before_action :item_find, only:[:show, :edit, :update, :destroy]
  before_action :sold_item, only:[:edit]

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
  end

  def edit
    if @history.present?
      redirect_to "/"
    elsif current_user.id != @item.user_id
      redirect_to "/"
    end
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if current_user.id == @item.user_id
      @item.destroy
    end
    redirect_to "/"
  end

  private

  def item_find
    @item = Item.find(params[:id])
  end

    def sold_item
      @history = History.where(item_id: @item.id)
    end

  def item_params
    params.require(:item).permit(:image, :title, :description, :item_category_id, :item_condition_id, :delivery_fee_id,
                                 :prefecture_id, :delivery_day_id, :price).merge(user_id: current_user.id)
  end
end

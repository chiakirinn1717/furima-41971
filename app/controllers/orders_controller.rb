class OrdersController < ApplicationController
    before_action :authenticate_user!, only: [:index]
    before_action :set_item, only:[:index, :create]
    before_action :sold_item, only:[:index]

    def index
        if @history.present?
            redirect_to "/"
        elsif current_user.id == @item.user_id
            redirect_to "/"
        else
            gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
            @address_history = AddressHistory.new
        end
    end

    def create
        @address_history = AddressHistory.new(address_params)
        if @address_history.valid?
            pay_item
            @address_history.save
            redirect_to root_path
        else
            gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
            render :index, status: :unprocessable_entity
        end
    end

    private

    def set_item
        @item = Item.find(params[:item_id])
    end

    def sold_item
        @history = History.where(item_id: @item.id)
    end

    def address_params
        params.require(:address_history).permit(:zipcode, :prefecture_id, :city, :street, :building, :phone_number).merge(user_id: current_user.id, item_id: @item.id, token: params[:token])
    end

    def pay_item
        Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
        Payjp::Charge.create(
            amount: @item.price,  # 商品の値段
            card: address_params[:token],    # カードトークン
            currency: 'jpy'                 # 通貨の種類（日本円）
        )
    end

end
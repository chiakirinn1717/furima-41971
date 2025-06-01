class OrdersController < ApplicationController
    before_action :authenticate_user!, only: [:index]
    before_action :set_item, only:[:index, :create]
    before_action :sold_item, only:[:index]

    def index
        if @history != nil
            redirect_to "/"
        elsif current_user.id == @item.user_id
            redirect_to "/"
        else
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
        Payjp.api_key = "sk_test_8cc3a8ff9e8a4704fabd5af8"  # 自身のPAY.JPテスト秘密鍵を記述しましょう
        Payjp::Charge.create(
            amount: @item.price,  # 商品の値段
            card: address_params[:token],    # カードトークン
            currency: 'jpy'                 # 通貨の種類（日本円）
        )
    end

end
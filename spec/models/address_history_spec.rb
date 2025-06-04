require 'rails_helper'

RSpec.describe AddressHistory, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @address_history = FactoryBot.build(:address_history, user_id: user.id, item_id: item.id)
  end

  describe '商品購入' do
    context '購入できる場合' do
      it 'すべての値が正しく入力されていれば保存できる' do
        expect(@address_history).to be_valid
      end
      it '建物名が空欄でも登録できる' do
        @address_history.building = ''
        expect(@address_history).to be_valid
      end
    end
    context '購入できない場合' do
      it '郵便番号が空欄だと登録できない' do
        @address_history.zipcode = ''
        @address_history.valid?
        expect(@address_history.errors.full_messages).to include("Zipcode can't be blank")
      end
      it '郵便番号が「3桁ハイフン4桁」以外だと登録できない' do
        @address_history.zipcode = '1234567'
        @address_history.valid?
        expect(@address_history.errors.full_messages).to include("Zipcode is invalid. Include hyphen(-)")
      end
      it '都道府県が空欄だと登録できない' do
        @address_history.prefecture_id = 1
        @address_history.valid?
        expect(@address_history.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '市町村が空欄だと登録できない' do
        @address_history.city = ''
        @address_history.valid?
        expect(@address_history.errors.full_messages).to include("City can't be blank")
      end
      it '番地が空欄だと登録できない' do
        @address_history.street = ''
        @address_history.valid?
        expect(@address_history.errors.full_messages).to include("Street can't be blank")
      end
      it '電話番号が空欄だと登録できない' do
        @address_history.phone_number = ''
        @address_history.valid?
        expect(@address_history.errors.full_messages).to include("Phone number can't be blank")
      end
      it '電話番号が9桁以下だと登録できない' do
        @address_history.phone_number = '123456789'
        @address_history.valid?
        expect(@address_history.errors.full_messages).to include("Phone number is too short")
      end
      it '電話番号がハイフンありの10桁だと登録できない' do
        @address_history.phone_number = '123-4567-89'
        @address_history.valid?
        expect(@address_history.errors.full_messages).to include("Phone number is not a number")
      end
      it '電話番号が12桁以上では登録できない' do
        @address_history.phone_number = '123456789012'
        @address_history.valid?
        expect(@address_history.errors.full_messages).to include("Phone number is too short")
      end
      it 'user_idが空では登録できない' do
        @address_history.user_id = ''
        @address_history.valid?
        expect(@address_history.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが空では登録できない' do
        @address_history.item_id = ''
        @address_history.valid?
        expect(@address_history.errors.full_messages).to include("Item can't be blank")
      end
      it 'tokenが空では登録できない' do
        @address_history.token = ''
        @address_history.valid?
        expect(@address_history.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end

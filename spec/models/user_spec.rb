require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できる場合' do
      it "nickname,email,password,password_confirmation,sei,mei,sei_kana,mei_kana,birthdayが存在すれば登録できる" do
        expect(@user).to be_valid
      end
    end
    context '新規登録できない場合' do
      it "nicknameが空では登録できない" do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it "emailが空では登録できない" do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "emailが重複していると登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it "passwordが空では登録できない" do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it "passwordが5文字以下では登録できない" do
        @user.password = '11111'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it "passwordは英字のみでは登録できない" do
        @user.password = 'abcdef'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password には英字と数字の両方を含めて設定してください")
      end
      it "passwordは数字のみでは登録できない" do
        @user.password = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password には英字と数字の両方を含めて設定してください")
      end
      it "passwordは全角だと登録できない" do
        @user.password = '１２３ＡＡＡ'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password には英字と数字の両方を含めて設定してください")
      end
      it "passwordとpassword_confirmationが不一致では登録できない" do
        @user.password = 'a1a1a1'
        @user.password_confirmation = 'b2b2b2'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "seiが空だと登録できない" do
        @user.sei = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Sei can't be blank")
      end
      it "meiが空だと登録できない" do
        @user.mei = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Mei can't be blank")
      end
      it "seiは半角入力だと登録できない" do
        @user.sei = 'ﾔﾏﾀﾞ'
        @user.valid?
        expect(@user.errors.full_messages).to include("Sei には半角カナを含めないでください")
      end
      it "meiは半角入力だと登録できない" do
        @user.mei = 'ﾀﾛｳ'
        @user.valid?
        expect(@user.errors.full_messages).to include("Mei には半角カナを含めないでください")
      end
      it "名前(カナ)のsei_kanaが空だと登録できない" do
        @user.sei_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Sei kana can't be blank")
      end
      it "名前(カナ)のmei_kanaが空だと登録できない" do
        @user.mei_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Mei kana can't be blank")
      end
      it "sei_kanaは半角入力だと登録できない" do
        @user.sei_kana = 'ﾔﾏﾀﾞ'
        @user.valid?
        expect(@user.errors.full_messages).to include("Sei kana is invalid")
      end
      it "mei_kanaは半角入力だと登録できない" do
        @user.mei_kana = 'ﾀﾛｳ'
        @user.valid?
        expect(@user.errors.full_messages).to include("Mei kana is invalid")
      end
      it "birthdayが空だと登録できない" do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end

require 'rails_helper'

RSpec.describe PurchaseBuyer, type: :model do
  before do
    @purchase_buyer = FactoryBot.build(:purchase_buyer)
  end

  describe '商品購入機能' do
    context '商品購入できるとき' do
      it '全項目正しく埋めていれば登録できる' do
        expect(@purchase_buyer).to be_valid
      end
    end

    context '商品購入できないとき' do
      it 'tokenが空では登録できないこと' do
        @purchase_buyer.token = nil
        @purchase_buyer.valid?
        expect(@purchase_buyer.errors.full_messages).to include("Token can't be blank")
      end
      it '郵便番号が空では登録できない' do
        @purchase_buyer.postal_code = ''
        @purchase_buyer.valid?
        expect(@purchase_buyer.errors.full_messages).to include("Postal code can't be blank")
      end
      it '郵便番号にハイフンがないと登録できない' do
        @purchase_buyer.postal_code = '1234567'
        @purchase_buyer.valid?
        expect(@purchase_buyer.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end
      it '市区町村が空では登録できない' do
        @purchase_buyer.municipality = ''
        @purchase_buyer.valid?
        expect(@purchase_buyer.errors.full_messages).to include("Municipality can't be blank")
      end
      it '市区町村が半角数字では登録できない' do
        @purchase_buyer.municipality = 1
        @purchase_buyer.valid?
        expect(@purchase_buyer.errors.full_messages).to include("Municipality is invalid. Input full-width characters.")
      end
      it '番地が空では登録できない' do
        @purchase_buyer.address = ''
        @purchase_buyer.valid?
        expect(@purchase_buyer.errors.full_messages).to include("Address can't be blank")
      end
      it '電話番号が空では登録できない' do
        @purchase_buyer.phone_number = ''
        @purchase_buyer.valid?
        expect(@purchase_buyer.errors.full_messages).to include("Phone number can't be blank")
      end
      it '電話番号が12文字以上では登録できない' do
        @purchase_buyer.phone_number = '090123456789'
        @purchase_buyer.valid?
        expect(@purchase_buyer.errors.full_messages).to include("Phone number is invalid. Input up to 11 characters")
      end
      it '都道府県が空では登録できない' do
        @purchase_buyer.prefecture_id = ''
        @purchase_buyer.valid?
        expect(@purchase_buyer.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '都道府県を選択しないと登録できない' do
        @purchase_buyer.prefecture_id = 0
        @purchase_buyer.valid?
        expect(@purchase_buyer.errors.full_messages).to include("Prefecture can't be blank")
      end
    end
  end
end
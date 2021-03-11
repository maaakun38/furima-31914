require 'rails_helper'

RSpec.describe Product, type: :model do
  before do
    @product = FactoryBot.build(:product)
  end

  describe '商品新規登録' do
    context '商品新規登録できるとき' do
      it '全項目埋めていれば登録できる' do
        expect(@product).to be_valid
      end
    end

    context '商品新規登録でいないとき' do
      it '画像が空では登録できない' do
        @product.image = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Image can't be blank")
      end
      it '商品名が空では登録できない' do
        @product.title = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Title can't be blank")
      end
      it '説明が空では登録できない' do
        @product.description = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Description can't be blank")
      end
      it 'カテゴリーが空では登録できない' do
        @product.category_id = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Category is not a number")
      end
      it '状態が空では登録できない' do
        @product.condition_id = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Condition is not a number")
      end
      it '配送料の負担が空では登録できない' do
        @product.shipping_charge_id = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Shipping charge is not a number")
      end
      it '発送元の地域が空では登録できない' do
        @product.prefecture_id = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Prefecture is not a number")
      end
      it '発送までの日数が空では登録できない' do
        @product.shipping_date_id = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Shipping date is not a number")
      end
      it '値段が空では登録できない' do
        @product.price = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Price can't be blank")
      end
      it '値段が300未満では登録できない' do
        @product.price = 299
        @product.valid?
        expect(@product.errors.full_messages).to include("Price is out of setting range")
      end
      it '値段が10000000以上では登録できない' do
        @product.price = 10000000
        @product.valid?
        expect(@product.errors.full_messages).to include("Price is out of setting range")
      end
      it '値段がローマ字では登録できない' do
        @product.price = 'a'
        @product.valid?
        expect(@product.errors.full_messages).to include("Price is out of setting range")
      end
      it '値段がひらがなでは登録できない' do
        @product.price = 'あ'
        @product.valid?
        expect(@product.errors.full_messages).to include("Price is out of setting range")
      end
      it '紐づくユーザーが存在しないと保存できないこと' do
        @product.user = nil
        @product.valid?
        expect(@product.errors.full_messages).to include('User must exist')
      end

    end
  end

      
end

require 'rails_helper'

RSpec.describe Item, type: :model do
 before do
  @item = FactoryBot.build(:item)
 end

  describe '商品出品機能' do

    context '商品出品がうまく行くとき' do
      it '全ての情報があれば出品できる' do
        expect(@item).to be_valid
      end
    end

    context '商品出品がうまく行かないとき' do
      it '商品画像を1枚つけることが必須であること' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it '商品名が必須であること' do
        @item.product_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Product name can't be blank")
      end
      it '商品の説明が必須であること' do
        @item.product_description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Product description can't be blank")

      end
      it 'カテゴリーの情報が必須であること' do
        @item.product_category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Product category must be other than 1")
      end
      it '商品の状態についての情報が必須であること' do
        @item.product_condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Product condition must be other than 1")
      end
      it '配送料の負担についての情報が必須であること' do
        @item.shipping_charges_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping charges must be other than 1")
      end
      it '発送元の地域についての情報が必須であること' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture must be other than 1")
      end
      it '発送までの日数についての情報が必須であること' do
        @item.days_ship_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Days ship must be other than 1")

      end
      it '販売価格についての情報が必須であること' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'priceが299以下の場合は保存できない' do
        @item.price = 100
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end
      it 'priceが10,000,000以上の場合は保存できない' do
        @item.price = 1000000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end
      it '全角文字では登録できないこと' do
        @item.price = 'あいうえお'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
      it '英数字混合では登録できないこと' do
        @item.price = 'a1111'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
      it '半角英字では登録できないこと' do
        @item.price = 'happy'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end

      
      


    end



  end
  
end


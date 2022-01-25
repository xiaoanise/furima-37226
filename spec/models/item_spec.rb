require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
    context '商品が出品できる場合' do
      it '全ての入力情報があれば出品できる' do
        expect(@item).to be_valid
      end
      it 'categoryが「---」以外であれば出品できる' do
        @item.category_id = 2
        expect(@item).to be_valid
      end
      it 'conditionが「---」以外であれば出品できる' do
        @item.condition_id = 2
        expect(@item).to be_valid
      end
      it 'poastage_payerが「---」以外であれば出品できる' do
        @item.postage_payer_id = 2
        expect(@item).to be_valid
      end
      it 'prefectureが「---」以外であれば出品できる' do
        @item.prefecture_id = 2
        expect(@item).to be_valid
      end
      it 'preparation_dayが「---」以外であれば出品できる' do
        @item.preparation_day_id = 2
        expect(@item).to be_valid
      end
      it 'priceが半角数字でかつ300円〜9,999,999円であれば出品できる' do
        @item.price = 300
        expect(@item).to be_valid
      end
    end

    context '商品が出品できない場合' do
      it 'userが紐付いていないと出品できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
      it 'imageがないと出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'nameが空では出品できない' do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it 'descriptionが空では出品できない' do
        @item.description = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end
      it 'categoryが「---」だと出品できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end
      it 'categoryが空では出品できない' do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it 'conditionが「---」だと出品できない' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition must be other than 1")
      end
      it 'conditionが空では出品できない' do
        @item.condition_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end
      it 'postage_payerが「---」だと出品できない' do
        @item.postage_payer_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Postage payer must be other than 1")
      end
      it 'postage_payerが空では出品できない' do
        @item.postage_payer_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Postage payer can't be blank")
      end
      it 'prefectureが「---」だと出品できない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture must be other than 1")
      end
      it 'prefectureが空では出品できない' do
        @item.prefecture_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'preparation_dayが「---」だと出品できない' do
        @item.preparation_day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Preparation day must be other than 1")
      end
      it 'preparation_dayが空では出品できない' do
        @item.preparation_day_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Preparation day can't be blank")
      end
      it 'priceが空では出品できない' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'priceが半角数値ではないと出品できない' do
        @item.price = "３２１"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
      it 'priceの範囲が300円未満だと出品できない' do
        @item.price = 100
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end
      it 'priceの範囲が9,999,999円を超えると出品できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end
    end
  end
end

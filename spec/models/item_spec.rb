require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe  '商品出品' do
    context '商品出品がうまくいく時' do
      it '全ての項目が入力されていれば出品することができる' do
        expect(@item).to be_valid
      end
    end

    context '商品出品がうまくいかない時' do
      it '商品画像の画像ファイルが未選択の時' do
        @item.item_image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Item image can't be blank")
      end
      it '商品名が未入力の時' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it '商品名の入力文字数が40を超える時' do
        @item.name = Faker::Lorem.characters(number: 41)
        @item.valid?
        expect(@item.errors.full_messages).to include('Name is too long (maximum is 40 characters)')
      end
      it '商品の説明が未入力の時' do
        @item.text = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Text can't be blank")
      end
      it '商品の説明の入力文字数が1000を超える時' do
        @item.text = Faker::Lorem.characters(number: 1001)
        @item.valid?
        expect(@item.errors.full_messages).to include('Text is too long (maximum is 1000 characters)')
      end
      it '商品の詳細の「カテゴリー」が未入力の時' do
        @item.category_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Category を入力して下さい（---以外の選択肢からお選び下さい）')
      end
      it '商品の詳細の「商品の状態」が未入力の時' do
        @item.condition_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Condition を入力して下さい（---以外の選択肢からお選び下さい）')
      end
      it '配送についての「配送料の負担」が未入力の時' do
        @item.delivery_charge_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Delivery charge を入力して下さい（---以外の選択肢からお選び下さい）')
      end
      it '配送についての「配送元の地域」が未入力の時' do
        @item.shipping_area_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Shipping area を入力して下さい（---以外の選択肢からお選び下さい）')
      end
      it '配送についての「配送までの日数」が未入力の時' do
        @item.days_to_ship_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Days to ship を入力して下さい（---以外の選択肢からお選び下さい）')
      end
      it '販売価格の「価格」が未入力の時' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank", 'Price is not a number')
      end
      it '販売価格の「価格」に数値以外の文字が入力された時' do
        @item.price = Faker::Lorem.sentence
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end
      it '販売価格の「価格」が300以下の時' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
      end
      it '販売価格の「価格」が9,999,999以上の時' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
      end
      it '商品出品者が居ない場合' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
    end
  end
end

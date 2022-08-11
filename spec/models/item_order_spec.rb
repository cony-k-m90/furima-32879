require 'rails_helper'

RSpec.describe ItemOrder, type: :model do
  before do
    @item_order = FactoryBot.build(:item_order)
  end

  describe '商品購入フォームから「配送先入力」箇所の保存' do
    context '「配送先入力」の項目が保存される' do
      it '配送先入力の全ての項目が正しく入力されていれば保存できること' do
        expect(@item_order).to be_valid
      end
      it 'building_name は空でも保存ができること' do
        @item_order.building_name = ''
        @item_order.valid?
      end
    end

    context '「配送先入力」の項目が保存されない' do
      it 'postal_code が空だと保存できないこと' do
        @item_order.postal_code = ''
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Postal code can't be blank", "Postal code is invalid. Include hyphen(-)")
      end
      it 'postal_code の半角のハイフンが正しい位置でないと保存できないこと' do
        @item_order.postal_code = '12-3456'
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end
      it 'postal_code が半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @item_order.postal_code = '1234567'
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end
      it 'postal_code が全角では保存できないこと' do
        @item_order.postal_code = '１２３−１２３４'
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end
      it 'shipping_area_id を選択していないと保存できないこと' do
        @item_order.shipping_area_id = nil
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Shipping area can't be blank")
      end
      it 'city が空だと保存できないこと' do
        @item_order.city = ''
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("City is invalid. Input full-width characters")
      end
      it 'city に半角英数字が使用されると保存できないこと' do
        @item_order.city = 'Yokohama-shi'
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("City is invalid. Input full-width characters")
      end
      it 'city に半角ｶﾅが使用されると保存できないこと' do
        @item_order.city = 'ﾖｺﾊﾏｼ'
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("City is invalid. Input full-width characters")
      end
      it 'house_number が空だと保存できないこと' do
        @item_order.house_number = ''
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("House number can't be blank")
      end
      it 'phone_number が空だと保存できないこと' do
        @item_order.phone_number = ''
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Phone number can't be blank", "Phone number is invalid")
      end
      it 'phone_number が全角数字では保存ができないこと' do
        @item_order.phone_number = '０９０１２３４５６７８'
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Phone number is invalid")
      end
      it 'phone_number が11桁以下では保存ができないこと' do
        @item_order.phone_number = '0901234567'
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Phone number is invalid")
      end
    end
  end
end
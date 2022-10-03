class ItemOrder
  include ActiveModel::Model
  attr_accessor :postal_code, :shipping_area_id, :city, :house_number, :building_name, :phone_number, :user_id, :item_id,
                :order_id, :token

  with_options presence: true do
    validates :house_number, :token, :user_id, :item_id
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :shipping_area_id, numericality: { other_than: 0, message: "can't be blank" }
    validates :city, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'is invalid. Input full-width characters' }
    validates :phone_number, format: { with: /\A[0-9]{10,11}\z/ }
  end

  def save
    # 学習メモ：各テーブルに保存するパラメーターを指定する。
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, shipping_area_id: shipping_area_id, city: city, house_number: house_number,
                   building_name: building_name, phone_number: phone_number, order_id: order.id)
  end
end

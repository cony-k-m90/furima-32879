class Item < ApplicationRecord

  extend ActiveHash::Associations::ActiveRecordExtensions
  
  belongs_to  :user
  belongs_to  :category
  belongs_to  :condition
  belongs_to  :delivery_charge
  belongs_to  :shipping_area
  belongs_to  :days_to_ship
  has_one_attached :item_image
  #has_one     :purchase

  with_options presence: true do
    validates :name, length: { maximum: 40 }
    validates :text, length: { maximum: 1000 }
    validates :user
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
    validates :item_image
  end

  with_options numericality: { other_than: 0, message: "を入力して下さい（---以外の選択肢からお選び下さい）" } do
    validates :category_id
    validates :condition_id
    validates :delivery_charge_id
    validates :shipping_area_id
    validates :days_to_ship_id
  end

end
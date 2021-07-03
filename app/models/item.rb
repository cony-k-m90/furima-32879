class Item < ApplicationRecord

  extend ActiveHash::Associations::ActiveRecordExtensions
  
  belongs_to  :user
  belongs_to  :category
  belongs_to  :condition
  belongs_to  :delivery_charge
  belongs_to  :shipping_area
  belongs_to  :days_to_ship
  has_one_attached :item_image
  #belongs_to  :has_one_attached
  #has_one     :purchase

  with_options presence: true do
    validates :name
    validates :text
    validates :price
    validates :user
  end
  with_options numericality: { other_than: 0 } do
    validates :category_id
    validates :condition_id
    validates :delivery_charge_id
    validates :shipping_area_id
    validates :days_to_ship_id
  end

end
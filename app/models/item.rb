class Item < ApplicationRecord

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to  :category
  belongs_to  :user
  has_one_attached :image
  #has_one     :purchase

  validates :name, presence: true
  validates :text, presence: true
  validates :category_id, numericality: { other_than: 0 }
  validates :condition_id, numericality: { other_than: 0 }
  validates :delivery_charge_id, numericality: { other_than: 0 }
  validates :shipping_area_id, numericality: { other_than: 0 }
  validates :days_to_ship_id, numericality: { other_than: 0 }
  validates :price, presence: true
  validates :user, presence: true
  # バリデーションの記述が終わったら with_options で纏める!!

end
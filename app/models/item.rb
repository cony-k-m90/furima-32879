class Item < ApplicationRecord

  belongs_to  :user
  #has_one     :purchase

  validates :name, presence: true
  validates :text, presence: true
  validates :category_id, presence: true
  validates :condition_id, presence: true
  validates :delivery_charge_id, presence: true
  validates :shipping_area_id, presence: true
  validates :days_to_ship_id, presence: true
  validates :price, presence: true
  validates :user, presence: true
  # バリデーションの記述が終わったら with_options で纏める!!

end
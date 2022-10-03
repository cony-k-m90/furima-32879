class Address < ApplicationRecord
  belongs_to  :order
  # 学習メモ：
  # アソシエーションでbelongs_toを指定した場合、相手のモデルのid（今回はorder_id）が
  # 「空ではないか」というバリデーションが、デフォルトでかかるようになっている。
  # バリデーションはフォームオブジェクト item_order.rb に記載。
end

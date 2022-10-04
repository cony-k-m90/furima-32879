FactoryBot.define do
  factory :item_order do
    token { 'tok_abcdefghijk00000000000000000' }
    postal_code { '123-1234' }
    shipping_area_id { '2' }
    city { '弘前市' }
    house_number { '青山11−22−33' }
    building_name { '青リンゴビル' }
    phone_number { Faker::Number.number(digits: 11) }  # 学習メモ：携帯電話の番号を想定
  end
end

FactoryBot.define do
  factory :item_order do
    postal_code { '123-1234' }
    shipping_area_id { '2' }
    city { '弘前市' }
    house_number { '青山11−22−33' }
    building_name { '青リンゴビル' }
    phone_number { Faker::Number.number(digits: 11) }
  end
end

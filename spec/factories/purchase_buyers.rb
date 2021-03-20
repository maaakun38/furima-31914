FactoryBot.define do
  factory :purchase_buyer do
    postal_code { '123-4567' }
    municipality { '東京都港区' }
    prefecture_id { 1 }
    address { '芝浦２丁目' }
    phone_number { '09012345678' }

  end
end

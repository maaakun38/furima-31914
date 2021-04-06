FactoryBot.define do
  factory :purchase_buyer do
    user_id { 1 }
    product_id { 1 }
    token { 'tok_abcdefghijk00000000000000000' }
    postal_code { '123-4567' }
    municipality { '東京都港区' }
    prefecture_id { 1 }
    address { '芝浦２丁目' }
    building { 'ムスブ田町' }
    phone_number { '09012345678' }

  end
end

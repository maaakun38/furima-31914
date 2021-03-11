FactoryBot.define do
  factory :product do
    title                 {'a'}
    description           {'あ'}
    category_id           {11}
    condition_id          {11}
    shipping_charge_id    {11}
    prefecture_id         {11}
    shipping_date_id      {11}
    price                 {300}
    association :user

    after(:build) do |product|
      product.image.attach(io: File.open('public/images/test_image.jpeg'), filename: 'test_image.jpeg', content_type: 'image/jpeg')
    end
  end
end

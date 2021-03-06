FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    first_name            {'山田'}
    last_name             {'太朗'}
    first_furigana        {'タロウ'}
    last_furigana         {'ヤマダ'}
    birth_date            {Faker::Date.birthday}
  end
end